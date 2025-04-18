import ServiceManagement
import SwiftUI
import VersionCompare

struct SettingView: View {
    @Binding var githubToken: String
    @AppStorage("interval") private var interval = Constants.defaultInterval
    @AppStorage("githubQuery") private var githubQuery = Constants.defaultGithubQuery
    @State private var launchAtLogin: Bool = SMAppService.mainApp.status == .enabled
    @State private var githubTokenIsValid = true
    @State private var showNewVersion = true

    private static let minInterval: Double = 1
    private static let maxInterval: Double = 14400

    var body: some View {
        Form {
            HStack {
                SecureField("GitHub token", text: $githubToken).onChange(of: githubToken) {
                    githubToken = githubToken.trimmingCharacters(in: .whitespacesAndNewlines)
                    Vault.githubToken = githubToken

                    Task {
                        githubTokenIsValid = await GitHubAPI.ping(self.githubToken)
                    }
                }
                .onAppear {
                    Task {
                        githubTokenIsValid = await GitHubAPI.ping(self.githubToken)
                    }
                }

                if githubTokenIsValid {
                    Text(Image(systemName: "checkmark")).foregroundStyle(.green)
                } else {
                    Text(Image(systemName: "exclamationmark.triangle")).foregroundStyle(.red)
                }
            }
            Link(destination: URL(string: "https://github.com/settings/tokens/new?scopes=repo")!) {
                Text("Create a personal access token").font(.footnote)
            }.effectHoverCursor()
            HStack {
                TextField("Search query", text: $githubQuery, axis: .vertical)
                    .lineLimit(5...)
                VStack {
                    Button {
                        for query in Query.parse(githubQuery) {
                            Task {
                                let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                                let url = URL(string: "https://github.com/pulls?q=" + (encoded ?? ""))!
                                NSWorkspace.shared.open(url)
                            }
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .effectHoverCursor()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.link)
                    Link(destination: URL(string: "https://docs.github.com/search-github/searching-on-github/searching-issues-and-pull-requests")!) {
                        Image(systemName: "questionmark.circle")
                    }.effectHoverCursor()
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
            HStack {
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
                if showNewVersion {
                    Link(destination: URL(string: "https://apps.apple.com/app/pullse/id6744265414")!) {
                        Text("New version available")
                            .font(.footnote)
                            .padding(.horizontal, 3)
                            .foregroundColor(.white)
                            .background(.blue, in: RoundedRectangle(cornerRadius: 5))
                    }
                    .effectHoverCursor()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }

            HStack {
                // swiftlint:disable force_cast
                let appVer = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
                // swiftlint:enable force_cast
                Text("Version. \(appVer)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Link(destination: URL(string: "https://github.com/winebarrel/Pullse")!) {
                    Image("github-mark")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .effectHoverCursor()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(20)
        .frame(width: 400)
        .onAppear {
            Task {
                // swiftlint:disable force_cast
                let bundleId = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
                let appVer = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
                // swiftlint:enable force_cast

                guard let info = await AppStoreAPI.getInfo(bundleId) else {
                    return
                }

                let appStoreVersion = Version(info.version)!
                let selfAppVersion = Version(appVer)!

                showNewVersion = appStoreVersion > selfAppVersion
            }
        }
    }

    func onClosed(_ action: @escaping () -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: NSWindow.willCloseNotification)) { notification in
            if let window = notification.object as? NSWindow, window.title == "Pullse Settings" {
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
