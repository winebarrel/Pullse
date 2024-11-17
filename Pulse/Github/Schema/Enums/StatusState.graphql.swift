// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension Github {
  /// The possible commit status states.
  enum StatusState: String, EnumType {
    /// Status is errored.
    case error = "ERROR"
    /// Status is expected.
    case expected = "EXPECTED"
    /// Status is failing.
    case failure = "FAILURE"
    /// Status is pending.
    case pending = "PENDING"
    /// Status is successful.
    case success = "SUCCESS"
  }

}