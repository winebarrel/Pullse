import Apollo
import Foundation

struct PullRequest: Identifiable {
    let owner: String
    let repo: String
    let title: String
    let url: String
    let latestUrl: String
    let mergeable: Github.MergeableState // NOTE: It might use
    let commitUrl: String
    let draft: Bool
    let approvedCount: Int
    let reviewResult: ReviewResult
    let checkResult: CheckResult
    let updatedAt: Date

    var id: String {
        url
    }

    var success: Bool {
        reviewResult == .success && checkResult == .success
    }

    var pending: Bool {
        draft ||
            (reviewResult == .pending && checkResult == .pending) ||
            (reviewResult == .success && checkResult == .pending) ||
            (reviewResult == .pending && checkResult == .success)
    }

    var statusEmoji: String {
        success ? "✅" : "❌"
    }

    enum ReviewResult {
        case success
        case failure
        case pending
    }

    enum CheckResult {
        case success
        case failure
        case pending
    }
}

typealias PullRequests = [PullRequest]

func - (left: PullRequests, right: PullRequests) -> PullRequests {
    let rightIDs = right.map { $0.id }
    return left.filter { !rightIDs.contains($0.id) }
}

actor GitHubAPI {
    private let client: ApolloClient

    init(_ githubToken: String) {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = DefaultInterceptorProvider(store: store)
        let url = URL(string: "https://api.github.com/graphql")!
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url,
            additionalHeaders: ["Authorization": "Bearer \(githubToken)"]
        )
        client = ApolloClient(networkTransport: transport, store: store)
    }

    func fetch(_ queries: [String]) async throws -> PullRequests {
        try await withThrowingTaskGroup(of: PullRequests.self) { group in
            var allPullRequests: [String: PullRequest] = [:]

            for query in queries {
                group.addTask {
                    try await self.fetchFromQuery(query)
                }
            }

            for try await prs in group {
                for pullRequest in prs {
                    allPullRequests[pullRequest.url] = pullRequest
                }
            }

            return Array(allPullRequests.values).sorted { $0.updatedAt > $1.updatedAt }
        }
    }

    private func fetchFromQuery(_ githubQuery: String) async throws -> PullRequests {
        try await withCheckedThrowingContinuation { continuation in
            let query = Github.SearchPullRequestsQuery(query: githubQuery)

            client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
                switch result {
                case .success(let value):
                    var pulls: PullRequests = []

                    value.data?.search.nodes?.forEach { body in
                        guard let asPull = body?.asPullRequest else {
                            return
                        }

                        guard let commit = asPull.commits.nodes?.first??.commit else {
                            return
                        }

                        let reviewDecision = asPull.reviewDecision

                        let reviewResult: PullRequest.ReviewResult = if reviewDecision == nil || reviewDecision == .approved {
                            .success
                        } else if reviewDecision == .changesRequested {
                            .failure
                        } else {
                            .pending
                        }

                        let state = commit.statusCheckRollup?.state

                        let checkResult: PullRequest.CheckResult = if state == .success {
                            .success
                        } else if state == .failure || state == .error {
                            .failure
                        } else {
                            // NOTE: If status check is not set, it will be pending
                            .pending
                        }

                        let comment = asPull.comments.edges?.first??.node
                        let review = asPull.reviews?.edges?.first??.node

                        let latestUrl = if let comment, let review {
                            if comment.createdAt > review.createdAt {
                                comment.url
                            } else {
                                review.url
                            }
                        } else if let comment {
                            comment.url
                        } else if let review {
                            review.url
                        } else {
                            asPull.url
                        }

                        let updatedAt = ISO8601DateFormatter().date(from: asPull.updatedAt) ?? Date(timeIntervalSince1970: 0)

                        let pull = PullRequest(
                            owner: asPull.repository.owner.login,
                            repo: asPull.repository.name,
                            title: asPull.title,
                            url: asPull.url,
                            latestUrl: latestUrl,
                            mergeable: asPull.mergeable.value ?? Github.MergeableState.unknown,
                            commitUrl: commit.url,
                            draft: asPull.isDraft,
                            approvedCount: asPull.approvedReviews?.totalCount ?? 0,
                            reviewResult: reviewResult,
                            checkResult: checkResult,
                            updatedAt: updatedAt
                        )

                        pulls.append(pull)
                    }

                    continuation.resume(returning: pulls)
                case .failure(let err):
                    if let err = err as? Apollo.ResponseCodeInterceptor.ResponseCodeError,
                       case .invalidResponseCode(let respOrNil, _) = err,
                       let resp = respOrNil
                    {
                        continuation.resume(throwing: GitHubError.respNotOK(resp))
                    } else {
                        continuation.resume(throwing: err)
                    }
                }
            }
        }
    }
}

enum GitHubError: LocalizedError {
    case respNotOK(HTTPURLResponse)

    var errorDescription: String? {
        switch self {
        case .respNotOK(let resp):
            let statusCode = resp.statusCode
            let statusMessage = HTTPURLResponse.localizedString(forStatusCode: statusCode)
            return "GitHub error: \(statusCode) \(statusMessage)"
        }
    }
}
