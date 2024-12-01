import Apollo
import Foundation

struct PullRequest: Identifiable {
    let owner: String
    let repo: String
    let title: String
    let url: String
    let mergeable: Github.MergeableState // NOTE: It might use
    let commitUrl: String
    let commentAuthor: String?
    let commentUrl: String?
    let draft: Bool
    let approvedCount: Int
    let reviewResult: ReviewResult
    let checkResult: CheckResult
    let updatedAt: Date

    var id: String {
        commitUrl
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

    var latestUrl: String {
        commentUrl ?? url
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

    func fetch(_ githubQuery: String) async throws -> PullRequests {
        return try await withCheckedThrowingContinuation { continuation in
            let query = Github.SearchPullRequestsQuery(query: githubQuery)

            client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
                switch result {
                case .success(let value):
                    var pulls: PullRequests = []

                    value.data?.search.nodes?.forEach { body in
                        if let asPull = body?.asPullRequest {
                            let reviewDecision = asPull.reviewDecision
                            let reviewResult: PullRequest.ReviewResult

                            if reviewDecision == nil || reviewDecision == .approved {
                                reviewResult = .success
                            } else if reviewDecision == .changesRequested {
                                reviewResult = .failure
                            } else {
                                reviewResult = .pending
                            }

                            guard let commit = asPull.commits.nodes?.first??.commit else {
                                return
                            }

                            let state = commit.statusCheckRollup?.state
                            let checkResult: PullRequest.CheckResult

                            if state == .success {
                                checkResult = .success
                            } else if state == .failure || state == .error {
                                checkResult = .failure
                            } else {
                                // NOTE: If status check is not set, it will be pending
                                checkResult = .pending
                            }

                            let updatedAt = ISO8601DateFormatter().date(from: asPull.updatedAt) ?? Date(timeIntervalSince1970: 0)

                            let pull = PullRequest(
                                owner: asPull.repository.owner.login,
                                repo: asPull.repository.name,
                                title: asPull.title,
                                url: asPull.url,
                                mergeable: asPull.mergeable.value ?? Github.MergeableState.unknown,
                                commitUrl: commit.url,
                                commentAuthor: asPull.comments.nodes?.first??.author?.login,
                                commentUrl: asPull.comments.nodes?.first??.url,
                                draft: asPull.isDraft,
                                approvedCount: asPull.approvedReviews?.totalCount ?? 0,
                                reviewResult: reviewResult,
                                checkResult: checkResult,
                                updatedAt: updatedAt
                            )

                            pulls.append(pull)
                        }
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
