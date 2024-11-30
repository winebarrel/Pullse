import Foundation
import SwiftUI

@MainActor
class PullRequestModel: ObservableObject {
    // TODO:
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
            updatedAt = Date()
        } catch let ghErr as GitHubError {
            error = ghErr
        } catch {
            Logger.shared.error("failed to get pull requests: \(error)")
        }
    }
}
