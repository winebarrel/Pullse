import Apollo
import Foundation

// NOTE: for Swift Concurrency
extension Github.SearchPullRequestsQuery.Data.Search.Node.AsPullRequest: @unchecked Sendable {}

struct PullRequestAPI {
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

    func fetch(_ githubQuery: String) async throws -> [Github.SearchPullRequestsQuery.Data.Search.Node.AsPullRequest] {
        return try await withCheckedThrowingContinuation { continuation in
            let query = Github.SearchPullRequestsQuery(query: githubQuery)

            client.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
                switch result {
                case .success(let value):
                    var pulls: [Github.SearchPullRequestsQuery.Data.Search.Node.AsPullRequest] = []

                    value.data?.search.nodes?.forEach { body in
                        if let pull = body?.asPullRequest {
                            pulls.append(pull)
                        }
                    }

                    continuation.resume(returning: pulls)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
