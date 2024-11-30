import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case settled
        case pending
    }

    @ObservedObject var pullRequest: PullRequestModel
    @State private var selection = Tab.settled
    @Binding var githubToken: String

    var body: some View {
        VStack {
            TabView(selection: $selection) {
                // TODO:
                ContentListView(
                    pulls: pullRequest.settled,
                    githubError: pullRequest.error
                )
                .tabItem {
                    Text("Settled (\(pullRequest.settled.count))")
                }
                .tag(Tab.settled)
                // TODO:
                ContentListView(
                    pulls: pullRequest.pending,
                    githubError: pullRequest.error
                )
                .tabItem {
                    Text("Pending (\(pullRequest.pending.count))")
                }
                .tag(Tab.pending)
            }
            .padding(.top, 5)
            HStack {
                Button {
                    Task {
                        let api = GitHubAPI(githubToken)
                        await pullRequest.update(api)
                    }
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                }

                let label = if let updatedAt = pullRequest.updatedAt {
                    updatedAt.shortTime()
                } else {
                    "-"
                }

                Text(label)
            }
            .padding(.bottom, 5)
        }
        .background(.background)
    }
}

#Preview {
    ContentView(
        pullRequest: PullRequestModel(),
        githubToken: .constant("")
    )
}
