import SwiftUI

struct RightClickMenuView: View {
    @AppStorage("githubQuery") private var githubQuery = Constants.defaultGithubQuery

    var body: some View {
        Divider()
        Button("Pull Requests") {
            Task {
                let url = URL(string: "https://github.com/pulls?q=" + (githubQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""))!
                NSWorkspace.shared.open(url)
            }
        }
        Button("Issues") {
            Task {
                let url = URL(string: "https://github.com/issues")!
                NSWorkspace.shared.open(url)
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
