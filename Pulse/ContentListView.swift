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
        } else if pulls.isEmpty {
            List {
                HStack {
                    Spacer()
                    Image(systemName: "tray")
                        .imageScale(.large)
                    Text("No pull requests")
                    Spacer()
                }
            }
        } else {
            // TODO:
            List {
                HStack {
                    Spacer()
                    Text("ContentListView")
                    Spacer()
                }
            }
        }
    }
}
