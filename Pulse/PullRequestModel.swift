import Foundation

@MainActor
class PullRequestModel: ObservableObject {
    // TODO:
    @Published var updatedAt: Date?

    func update(_ api: PullRequestAPI) async {
        // TODO:
        updatedAt = Date()
    }
}
