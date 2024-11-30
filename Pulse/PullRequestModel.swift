import Foundation
import SwiftUI

@MainActor
class PullRequestModel: ObservableObject {
    @AppStorage("githubQuery") private var githubQuery = Constants.defaultGithubQuery
    @Published var settled: PullRequests = []
    @Published var pending: PullRequests = []
    @Published var updatedAt: Date?
    @Published var error: GitHubError?

    func update(_ api: GitHubAPI) async {
        do {
            let pulls = try await api.fetch(githubQuery)
            var settled: PullRequests = []
            var pending: PullRequests = []

            for pull in pulls {
                if pull.pending {
                    pending.append(pull)
                } else {
                    settled.append(pull)
                }
            }

            self.settled = settled
            self.pending = pending
            error = nil
            updatedAt = Date()
        } catch let githubError as GitHubError {
            error = githubError
            self.settled = []
            self.pending = []
            updatedAt = nil
        } catch {
            Logger.shared.error("failed to get pull requests: \(error)")
        }
    }
}
