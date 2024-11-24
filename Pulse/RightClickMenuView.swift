import SwiftUI

struct RightClickMenuView: View {
    var body: some View {
        Divider()
        Button("TODO") {
            // TODO:
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
