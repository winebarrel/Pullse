// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Github {
  class SearchPullRequestsQuery: GraphQLQuery {
    static let operationName: String = "SearchPullRequests"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query SearchPullRequests($query: String!) { search(type: ISSUE, last: 100, query: $query) { __typename nodes { __typename ... on PullRequest { repository { __typename name owner { __typename login } } title url reviewDecision mergeable isDraft updatedAt comments(last: 1) { __typename nodes { __typename author { __typename login } url } } commits(last: 1) { __typename nodes { __typename commit { __typename url statusCheckRollup { __typename state } } } } approvedReviews: reviews(states: APPROVED) { __typename totalCount } } } } }"#
      ))

    public var query: String

    public init(query: String) {
      self.query = query
    }

    public var __variables: Variables? { ["query": query] }

    struct Data: Github.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { Github.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("search", Search.self, arguments: [
          "type": "ISSUE",
          "last": 100,
          "query": .variable("query")
        ]),
      ] }

      /// Perform a search across resources, returning a maximum of 1,000 results.
      var search: Search { __data["search"] }

      /// Search
      ///
      /// Parent Type: `SearchResultItemConnection`
      struct Search: Github.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { Github.Objects.SearchResultItemConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        /// A list of nodes.
        var nodes: [Node?]? { __data["nodes"] }

        /// Search.Node
        ///
        /// Parent Type: `SearchResultItem`
        struct Node: Github.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { Github.Unions.SearchResultItem }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsPullRequest.self),
          ] }

          var asPullRequest: AsPullRequest? { _asInlineFragment() }

          /// Search.Node.AsPullRequest
          ///
          /// Parent Type: `PullRequest`
          struct AsPullRequest: Github.InlineFragment {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            typealias RootEntityType = SearchPullRequestsQuery.Data.Search.Node
            static var __parentType: any ApolloAPI.ParentType { Github.Objects.PullRequest }
            static var __selections: [ApolloAPI.Selection] { [
              .field("repository", Repository.self),
              .field("title", String.self),
              .field("url", Github.URI.self),
              .field("reviewDecision", GraphQLEnum<Github.PullRequestReviewDecision>?.self),
              .field("mergeable", GraphQLEnum<Github.MergeableState>.self),
              .field("isDraft", Bool.self),
              .field("updatedAt", Github.DateTime.self),
              .field("comments", Comments.self, arguments: ["last": 1]),
              .field("commits", Commits.self, arguments: ["last": 1]),
              .field("reviews", alias: "approvedReviews", ApprovedReviews?.self, arguments: ["states": "APPROVED"]),
            ] }

            /// The repository associated with this node.
            var repository: Repository { __data["repository"] }
            /// Identifies the pull request title.
            var title: String { __data["title"] }
            /// The HTTP URL for this pull request.
            var url: Github.URI { __data["url"] }
            /// The current status of this pull request with respect to code review.
            var reviewDecision: GraphQLEnum<Github.PullRequestReviewDecision>? { __data["reviewDecision"] }
            /// Whether or not the pull request can be merged based on the existence of merge conflicts.
            var mergeable: GraphQLEnum<Github.MergeableState> { __data["mergeable"] }
            /// Identifies if the pull request is a draft.
            var isDraft: Bool { __data["isDraft"] }
            /// Identifies the date and time when the object was last updated.
            var updatedAt: Github.DateTime { __data["updatedAt"] }
            /// A list of comments associated with the pull request.
            var comments: Comments { __data["comments"] }
            /// A list of commits present in this pull request's head branch not present in the base branch.
            var commits: Commits { __data["commits"] }
            /// A list of reviews associated with the pull request.
            var approvedReviews: ApprovedReviews? { __data["approvedReviews"] }

            /// Search.Node.AsPullRequest.Repository
            ///
            /// Parent Type: `Repository`
            struct Repository: Github.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { Github.Objects.Repository }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("name", String.self),
                .field("owner", Owner.self),
              ] }

              /// The name of the repository.
              var name: String { __data["name"] }
              /// The User owner of the repository.
              var owner: Owner { __data["owner"] }

              /// Search.Node.AsPullRequest.Repository.Owner
              ///
              /// Parent Type: `RepositoryOwner`
              struct Owner: Github.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { Github.Interfaces.RepositoryOwner }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("login", String.self),
                ] }

                /// The username used to login.
                var login: String { __data["login"] }
              }
            }

            /// Search.Node.AsPullRequest.Comments
            ///
            /// Parent Type: `IssueCommentConnection`
            struct Comments: Github.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { Github.Objects.IssueCommentConnection }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("nodes", [Node?]?.self),
              ] }

              /// A list of nodes.
              var nodes: [Node?]? { __data["nodes"] }

              /// Search.Node.AsPullRequest.Comments.Node
              ///
              /// Parent Type: `IssueComment`
              struct Node: Github.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { Github.Objects.IssueComment }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("author", Author?.self),
                  .field("url", Github.URI.self),
                ] }

                /// The actor who authored the comment.
                var author: Author? { __data["author"] }
                /// The HTTP URL for this issue comment
                var url: Github.URI { __data["url"] }

                /// Search.Node.AsPullRequest.Comments.Node.Author
                ///
                /// Parent Type: `Actor`
                struct Author: Github.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: any ApolloAPI.ParentType { Github.Interfaces.Actor }
                  static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("login", String.self),
                  ] }

                  /// The username of the actor.
                  var login: String { __data["login"] }
                }
              }
            }

            /// Search.Node.AsPullRequest.Commits
            ///
            /// Parent Type: `PullRequestCommitConnection`
            struct Commits: Github.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { Github.Objects.PullRequestCommitConnection }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("nodes", [Node?]?.self),
              ] }

              /// A list of nodes.
              var nodes: [Node?]? { __data["nodes"] }

              /// Search.Node.AsPullRequest.Commits.Node
              ///
              /// Parent Type: `PullRequestCommit`
              struct Node: Github.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { Github.Objects.PullRequestCommit }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("commit", Commit.self),
                ] }

                /// The Git commit object
                var commit: Commit { __data["commit"] }

                /// Search.Node.AsPullRequest.Commits.Node.Commit
                ///
                /// Parent Type: `Commit`
                struct Commit: Github.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: any ApolloAPI.ParentType { Github.Objects.Commit }
                  static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("url", Github.URI.self),
                    .field("statusCheckRollup", StatusCheckRollup?.self),
                  ] }

                  /// The HTTP URL for this commit
                  var url: Github.URI { __data["url"] }
                  /// Check and Status rollup information for this commit.
                  var statusCheckRollup: StatusCheckRollup? { __data["statusCheckRollup"] }

                  /// Search.Node.AsPullRequest.Commits.Node.Commit.StatusCheckRollup
                  ///
                  /// Parent Type: `StatusCheckRollup`
                  struct StatusCheckRollup: Github.SelectionSet {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    static var __parentType: any ApolloAPI.ParentType { Github.Objects.StatusCheckRollup }
                    static var __selections: [ApolloAPI.Selection] { [
                      .field("__typename", String.self),
                      .field("state", GraphQLEnum<Github.StatusState>.self),
                    ] }

                    /// The combined status for the commit.
                    var state: GraphQLEnum<Github.StatusState> { __data["state"] }
                  }
                }
              }
            }

            /// Search.Node.AsPullRequest.ApprovedReviews
            ///
            /// Parent Type: `PullRequestReviewConnection`
            struct ApprovedReviews: Github.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { Github.Objects.PullRequestReviewConnection }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("totalCount", Int.self),
              ] }

              /// Identifies the total count of items in the connection.
              var totalCount: Int { __data["totalCount"] }
            }
          }
        }
      }
    }
  }

}