import ServiceManagement
import SwiftUI

struct SettingView: View {
    @Binding var githubToken: String
    @AppStorage("interval") private var interval = Constants.defaultInterval
    @AppStorage("githubQuery") private var githubQuery = Constants.defaultGithubQuery
    @State private var launchAtLogin: Bool = SMAppService.mainApp.status == .enabled
    private static let minInterval: Double = 1
    private static let maxInterval: Double = 14400

    var body: some View {
        Form {
            HStack {
                SecureField("GitHub token", text: $githubToken).onChange(of: githubToken) {
                    Vault.githubToken = githubToken
                }
                Link(destination: URL(string: "https://github.com/settings/tokens")!) {
                    Image(systemName: "questionmark.circle")
                }
            }
            HStack {
                TextField("Search query", text: $githubQuery, axis: .vertical)
                    .lineLimit(5...)
                VStack {
                    Link(destination: URL(string: "https://github.com/pulls?q=" + (githubQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""))!) {
                        Image(systemName: "magnifyingglass")
                    }
                    Link(destination: URL(string: "https://docs.github.com/search-github/searching-on-github/searching-issues-and-pull-requests")!) {
                        Image(systemName: "questionmark.circle")
                    }
                }
            }
            HStack {
                TextField("Interval (sec)", value: $interval, format: .number.grouping(.never))
                    .onChange(of: interval) {
                        if interval < SettingView.minInterval {
                            interval = SettingView.minInterval
                        } else if interval > SettingView.maxInterval {
                            interval = SettingView.maxInterval
                        }
                    }
                Image(systemName: "questionmark.circle") // for padding
                    .opacity(0.0)
            }
            Toggle("Launch at login", isOn: $launchAtLogin)
                .onChange(of: launchAtLogin) {
                    do {
                        if launchAtLogin {
                            try SMAppService.mainApp.register()
                        } else {
                            try SMAppService.mainApp.unregister()
                        }
                    } catch {
                        Logger.shared.error("failed to update 'Launch at login': \(error)")
                    }
                }
            Link(destination: URL(string: "https://github.com/winebarrel/Pulse")!) {
                // swiftlint:disable force_cast
                let appVer = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
                let buildVer = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
                // swiftlint:enable force_cast
                Text("Ver. \(appVer).\(buildVer)")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(20)
        .frame(width: 400)
    }

    func onClosed(_ action: @escaping () -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: NSWindow.willCloseNotification)) { notification in
            if let window = notification.object as? NSWindow, window.title == "Pulse Settings" {
                action()
            }
        }
    }
}

#Preview {
    SettingView(
        githubToken: .constant("")
    )
}
