import AsyncAlgorithms
import MenuBarExtraAccess
import SwiftUI

@main
struct PulseApp: App {
    @State private var initialized = false
    @State private var isMenuPresented = false
    @State private var timer: Task<Void, Never>?
    // NOTE: Define "githubToken" in PulseApp so that values are not lost during sleep.
    @State private var githubToken = Vault.githubToken
    @AppStorage("interval") private var interval = Constants.defaultInterval
    @StateObject private var pullRequest = PullRequestModel()

    private var popover: NSPopover = {
        let pop = NSPopover()
        pop.behavior = .transient
        pop.animates = false
        pop.contentSize = NSSize(width: 500, height: 400)
        return pop
    }()

    private func initialize() {
        // TODO:
        // Notification.initialize()

        let contentView = ContentView()
        popover.contentViewController = NSHostingController(rootView: contentView)

        scheduleUpdate()
    }

    private func scheduleUpdate() {
        timer?.cancel()

        let seq = AsyncTimerSequence(
            interval: .seconds(interval),
            clock: .continuous
        )

        timer = Task {
            let api = PullRequestAPI(githubToken)
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
            // TODO:
            Image("check.black")
        }.menuBarExtraAccess(isPresented: $isMenuPresented) { statusItem in
            if !initialized {
                initialize()
                initialized = true
            }

            if let button = statusItem.button {
                let mouseHandlerView = MouseHandlerView(frame: button.frame)

                mouseHandlerView.onMouseDown = {
                    if popover.isShown {
                        popover.performClose(nil)
                    } else {
                        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.maxY)
                        popover.contentViewController?.view.window?.makeKey()
                    }
                }

                button.addSubview(mouseHandlerView)
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
