import SwiftUI

@main
struct PulseApp: App {
    var body: some Scene {
        MenuBarExtra {
            RightClickMenuView()
        } label: {
            // TODO:
            Image(systemName: "leaf")
        }
    }
}
