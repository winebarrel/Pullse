// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension Github.Unions {
  /// The results of a search.
  static let SearchResultItem = Union(
    name: "SearchResultItem",
    possibleTypes: [
      Github.Objects.App.self,
      Github.Objects.Discussion.self,
      Github.Objects.Issue.self,
      Github.Objects.MarketplaceListing.self,
      Github.Objects.Organization.self,
      Github.Objects.PullRequest.self,
      Github.Objects.Repository.self,
      Github.Objects.User.self
    ]
  )
}