// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension Github {
  /// Whether or not a PullRequest can be merged.
  enum MergeableState: String, EnumType {
    /// The pull request cannot be merged due to merge conflicts.
    case conflicting = "CONFLICTING"
    /// The pull request can be merged.
    case mergeable = "MERGEABLE"
    /// The mergeability of the pull request is still being calculated.
    case unknown = "UNKNOWN"
  }

}