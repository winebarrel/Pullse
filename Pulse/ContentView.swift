import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case settled
        case pending
    }

    @ObservedObject var pullRequest: PullRequestModel
    @State private var selection = Tab.settled

    var body: some View {
        VStack {
            TabView(selection: $selection) {
                // TODO:
                PullRequestListView()
                    .tabItem {
                        Text("Settled (0)")
                    }
                    .tag(Tab.settled)
                // TODO:
                PullRequestListView()
                    .tabItem {
                        Text("Pending (0)")
                    }
                    .tag(Tab.pending)
            }
            .padding(.top, 5)
            HStack {
                Image(systemName: "clock.arrow.circlepath")
                Text("00:00") // TODO:
            }
            .padding(.bottom, 5)
        }
        .background(.background)
    }
}

#Preview {
    ContentView(pullRequest: PullRequestModel())
}
