import SwiftUI

struct ContentListView: View {
    let pulls: PullRequests
    let githubError: GitHubError?
    @State private var hoverId = ""

    var body: some View {
        if let githubError {
            List {
                HStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle")
                        .imageScale(.large)
                    Text(githubError.localizedDescription)
                    Spacer()
                }
            }
        } else if pulls.isEmpty {
            List {
                HStack {
                    Spacer()
                    Image(systemName: "tray")
                        .imageScale(.large)
                    Text("No pull requests")
                    Spacer()
                }
            }
        } else {
            List(pulls) { pull in
                VStack(alignment: .leading) {
                    Text("\(pull.owner)/\(pull.repo)")
                        .font(.caption2)
                        .multilineTextAlignment(.leading)
                    Link(destination: URL(string: pull.latestUrl)!) {
                        if pull.draft {
                            Text("Draft")
                                .font(.caption)
                                .padding(.horizontal, 3)
                                .foregroundColor(.white)
                                .background(.gray, in: RoundedRectangle(cornerRadius: 5))
                        }
                        let status = pull.success ? "✅" : "❌"
                        let label = pull.pending ? pull.title : status + pull.title
                        Text(label)
                            .multilineTextAlignment(.leading)
                            .underline(hoverId == pull.id)
                            .onHover { hovering in
                                hoverId = hovering ? pull.id : ""
                            }
                        if pull.approvedCount > 0 {
                            HStack(spacing: 0) {
                                Image(systemName: "person.crop.circle.badge.checkmark")
                                Text(String(pull.approvedCount))
                                    .font(.footnote)
                            }
                            .foregroundColor(.primary)
                        }
                    }
                    if let author = pull.commentAuthor {
                        HStack(spacing: 0) {
                            Image(systemName: "bubble")
                            Text("@\(author)")
                                .font(.footnote)
                        }
                    }
                }
            }
        }
    }
}
