import Foundation
import SwiftUI

@MainActor
class PullRequestModel: ObservableObject {
    enum Status: String {
        case unsettled = "check.black"
        case success = "check.green"
        case failure = "check.red"
        case error
    }

    @AppStorage("githubQuery") private var githubQuery = Constants.defaultGithubQuery
    @Published var settled: PullRequests = []
    @Published var pending: PullRequests = []
    @Published var updatedAt: Date?
    @Published var error: GitHubError?
    @Published var status: Status = .unsettled

    func update(_ api: GitHubAPI) async {
        do {
            let queries = Query.parse(githubQuery)
            let pulls = try await api.fetchQueries(queries)
            var settled: PullRequests = []
            var pending: PullRequests = []

            for pull in pulls {
                if pull.pending {
                    pending.append(pull)
                } else {
                    settled.append(pull)
                }
            }

            if settled.isEmpty {
                status = .unsettled
            } else if settled.allSatisfy({ $0.success }) {
                status = .success
            } else {
                status = .failure
            }

            let newSettled = settled - self.settled
            self.settled = settled
            self.pending = pending
            error = nil
            updatedAt = Date()

            if !newSettled.isEmpty {
                notify(newSettled)
            }
        } catch let githubError as GitHubError {
            error = githubError
            status = .error
            self.settled = []
            self.pending = []
            updatedAt = nil
        } catch {
            Logger.shared.error("failed to get pull requests: \(error)")
        }
    }

    private func notify(_ pulls: PullRequests) {
        for pull in pulls {
            Task {
                await Notification.notify(
                    id: pull.id,
                    title: "\(pull.owner)/\(pull.repo)",
                    body: pull.statusEmoji + pull.title,
                    url: pull.latestUrl
                )
            }
        }
    }
}
