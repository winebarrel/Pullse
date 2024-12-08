import SwiftUI

struct RightClickMenuView: View {
    @AppStorage("githubQuery") private var githubQuery = Constants.defaultGithubQuery

    var body: some View {
        Divider()
        Button("Pull Requests") {
            for query in Query.parse(githubQuery) {
                Task {
                    let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    let url = URL(string: "https://github.com/pulls?q=" + (encoded ?? ""))!
                    NSWorkspace.shared.open(url)
                }
            }
        }
        Button("Issues") {
            for query in Query.parse(githubQuery) {
                Task {
                    let issueQuery = query.replacingOccurrences(of: "is:pr", with: "is:issue")
                    let encoded = issueQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    let url = URL(string: "https://github.com/issues?q=" + (encoded ?? ""))!
                    NSWorkspace.shared.open(url)
                }
            }
        }
        Divider()
        SettingsLink {
            Text("Settings")
        }.preActionButtonStyle {
            NSApp.activate(ignoringOtherApps: true)
        }
        Divider()
        Button("Quit") {
            NSApplication.shared.terminate(self)
        }
    }
}
