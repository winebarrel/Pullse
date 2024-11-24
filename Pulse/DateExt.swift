import Foundation

extension Date {
    func shortTime() -> String {
        let dtfmt = DateFormatter()
        dtfmt.dateStyle = .none
        dtfmt.timeStyle = .short
        return dtfmt.string(from: self)
    }

    func relative() -> String {
        let dtfmt = RelativeDateTimeFormatter()
        dtfmt.unitsStyle = .abbreviated
        return dtfmt.localizedString(for: self, relativeTo: Date())
    }
}
