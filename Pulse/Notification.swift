import UserNotifications

enum Notification {
    private static let bundleIdentifier = Bundle.main.bundleIdentifier!

    static func notify(id: String, title: String, body: String, url: String) async {
        let userNotificationCenter = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.userInfo = ["url": url]
        content.sound = UNNotificationSound.default

        let req = UNNotificationRequest(identifier: "\(bundleIdentifier).\(id)", content: content, trigger: nil)
        try? await userNotificationCenter.add(req)
    }

    static func remove(ids: [String]) {
        let userNotificationCenter = UNUserNotificationCenter.current()
        let idsWithBundleId = ids.map { "\(bundleIdentifier).\($0)" }
        userNotificationCenter.removeDeliveredNotifications(
            withIdentifiers: idsWithBundleId)
    }
}
