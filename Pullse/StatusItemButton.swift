import AppKit

enum StatusItemButton {
    // NOTE: SwiftUI does not expose the NSStatusItem that MenuBarExtra creates,
    // so it is looked up the same way MenuBarExtraAccess does: by reading the
    // private "statusItem" property of the app's NSStatusBarWindow.
    @MainActor
    static func find() -> NSStatusBarButton? {
        for window in NSApp.windows where window.className.contains("NSStatusBarWindow") {
            // NOTE: On Macs with "Displays have Separate Spaces", inactive screens
            // get an NSStatusItemReplicant. Only the original has the live button.
            guard let statusItem = window.value(forKey: "statusItem") as? NSStatusItem,
                  !statusItem.className.contains("Replicant")
            else {
                continue
            }

            if let button = statusItem.button {
                return button
            }
        }

        return nil
    }
}
