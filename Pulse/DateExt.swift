import Foundation

extension Date {
    func shortTime() -> String {
        let dtfmt = DateFormatter()
        dtfmt.dateStyle = .none
        dtfmt.timeStyle = .short
        return dtfmt.string(from: self)
    }
}
