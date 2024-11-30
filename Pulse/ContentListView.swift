import SwiftUI

struct ContentListView: View {
    let pulls: PullRequests
    let githubError: GitHubError?

    var body: some View {
        if let githubError {
            List {
                HStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle")
                        .imageScale(.large)
                    Text(githubError.localizedDescription)
                    Spacer()
                }
            }
        } else {
            // TODO:
            Text("ContentListView")
        }
    }
}
