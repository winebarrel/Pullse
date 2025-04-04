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
            if githubToken.isEmpty {
                VStack {
                    Spacer()
                    Image(nsImage: NSImage(named: "AppIcon")!)
                    Link(destination: URL(string: "https://github.com/winebarrel/Pullse#configuration")!) {
                        Text("Set up your GotHub token.")
                    }.effectHoverCursor()
                    HStack {
                        Spacer()
                        SettingsLink {
                            Image(systemName: "gearshape")
                            Text("Settings")
                        }.preActionButtonStyle {
                            NSApp.activate(ignoringOtherApps: true)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                TabView(selection: $selection) {
                    ContentListView(
                        pulls: pullRequest.settled,
                        githubError: pullRequest.error
                    )
                    .tabItem {
                        Text("Settled (\(pullRequest.settled.count))")
                    }
                    .tag(Tab.settled)
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
                        let pulls: PullRequests
                        switch selection {
                        case .settled:
                            pulls = pullRequest.settled
                        case .pending:
                            pulls = pullRequest.pending
                        }

                        let list = pulls.map { $0.titleAndURL }
                        Pasteboard.copy(list.joined(separator: "\n"))
                    } label: {
                        Image(systemName: "document.on.document")
                    }.effectHoverCursor()

                    Button {
                        Task {
                            let api = GitHubAPI(githubToken)
                            await pullRequest.update(api)
                        }
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }.effectHoverCursor()

                    let label = if let updatedAt = pullRequest.updatedAt {
                        updatedAt.shortTime()
                    } else {
                        "-"
                    }

                    Text(label)
                }
                .padding(.bottom, 5)
            }
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
