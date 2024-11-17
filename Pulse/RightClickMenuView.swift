import SwiftUI

struct RightClickMenuView: View {
    var body: some View {
        Button("Quit") {
            NSApplication.shared.terminate(self)
        }
    }
}
