import AsyncAlgorithms
import MenuBarExtraAccess
import SwiftUI

@main
struct PullseApp: App {
    @State private var initialized = false
    @State private var isMenuPresented = false
    @State private var timer: Task<Void, Never>?
    // NOTE: Define "githubToken" in PullseApp so that values are not lost during sleep.
    @State private var githubToken = Vault.githubToken
    @AppStorage("interval") private var interval = Constants.defaultInterval
    @StateObject private var pullRequest = PullRequestModel()

    // swiftlint:disable unused_declaration
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    // swiftlint:enable unused_declaration

    private var popover = {
        let pop = NSPopover()
        pop.behavior = .transient
        pop.animates = false
        pop.contentSize = NSSize(width: 500, height: 400)
        return pop
    }()

    private static let mouseHandlerRetryCount = 100
    private static let mouseHandlerRetryInterval: TimeInterval = 0.2

    private func initialize() {
        let contentView = ContentView(pullRequest: pullRequest, githubToken: $githubToken)
        popover.contentViewController = NSHostingController(rootView: contentView)

        installMouseHandler()
        scheduleUpdate()
    }

    // NOTE: MenuBarExtraAccess hands over the status item only once, within two
    // seconds of launch, and never retries if it fails to find it in time. Keep
    // looking so that a slow launch does not leave the popover unreachable for
    // the rest of the session.
    private func installMouseHandler() {
        Task {
            for _ in 0 ..< PullseApp.mouseHandlerRetryCount {
                if let button = StatusItemButton.find() {
                    attachMouseHandler(to: button)
                    return
                }

                try? await Task.sleep(for: .seconds(PullseApp.mouseHandlerRetryInterval))
            }

            Logger.shared.error("status item button not found: left click will not open the popover")
        }
    }

    private func attachMouseHandler(to button: NSStatusBarButton) {
        guard !button.subviews.contains(where: { $0 is MouseHandlerView }) else {
            return
        }

        let mouseHandlerView = MouseHandlerView(frame: button.bounds)
        mouseHandlerView.autoresizingMask = [.width, .height]

        mouseHandlerView.onMouseDown = {
            if self.popover.isShown {
                self.popover.performClose(nil)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.maxY)
                self.popover.contentViewController?.view.window?.makeKey()
            }
        }

        button.addSubview(mouseHandlerView)
    }

    private func scheduleUpdate() {
        timer?.cancel()

        let seq = AsyncTimerSequence(
            interval: .seconds(interval),
            clock: .continuous
        )

        timer = Task {
            let api = GitHubAPI(githubToken)
            await pullRequest.update(api)

            for await _ in seq {
                await pullRequest.update(api)
            }
        }
    }

    var body: some Scene {
        MenuBarExtra {
            RightClickMenuView()
        } label: {
            Image(pullRequest.status.rawValue).onAppear {
                if !initialized {
                    initialize()
                    initialized = true
                }
            }
        }.menuBarExtraAccess(isPresented: $isMenuPresented) { statusItem in
            if let button = statusItem.button {
                attachMouseHandler(to: button)
            }
        }
        Settings {
            SettingView(githubToken: $githubToken)
                .onClosed {
                    scheduleUpdate()
                }
        }
    }
}
