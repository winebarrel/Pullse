// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension Github {
  /// The review status of a pull request.
  enum PullRequestReviewDecision: String, EnumType {
    /// The pull request has received an approving review.
    case approved = "APPROVED"
    /// Changes have been requested on the pull request.
    case changesRequested = "CHANGES_REQUESTED"
    /// A review is required before the pull request can be merged.
    case reviewRequired = "REVIEW_REQUIRED"
  }

}