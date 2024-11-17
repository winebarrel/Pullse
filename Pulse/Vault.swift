import Foundation
import Valet

enum Vault {
    static let shared = Valet.valet(with: Identifier(nonEmpty: Bundle.main.bundleIdentifier)!, accessibility: .whenUnlocked)

    static var githubToken: String {
        get {
            do {
                return try shared.string(forKey: "githubToken")
            } catch KeychainError.itemNotFound {
                // Nothing to do
            } catch {
                Logger.shared.error("failed to get githubToken from Valet: \(error)")
            }

            return ""
        }

        set(token) {
            do {
                if token.isEmpty {
                    try shared.removeObject(forKey: "githubToken")
                } else {
                    try shared.setString(token, forKey: "githubToken")
                }
            } catch {
                Logger.shared.error("failed to set githubToken to Valet: \(error)")
            }
        }
    }
}
