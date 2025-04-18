// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol Github_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Github.SchemaMetadata {}

protocol Github_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Github.SchemaMetadata {}

protocol Github_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Github.SchemaMetadata {}

protocol Github_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Github.SchemaMetadata {}

extension Github {
  typealias SelectionSet = Github_SelectionSet

  typealias InlineFragment = Github_InlineFragment

  typealias MutableSelectionSet = Github_MutableSelectionSet

  typealias MutableInlineFragment = Github_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "AddedToMergeQueueEvent": return Github.Objects.AddedToMergeQueueEvent
      case "AddedToProjectEvent": return Github.Objects.AddedToProjectEvent
      case "App": return Github.Objects.App
      case "AssignedEvent": return Github.Objects.AssignedEvent
      case "AutoMergeDisabledEvent": return Github.Objects.AutoMergeDisabledEvent
      case "AutoMergeEnabledEvent": return Github.Objects.AutoMergeEnabledEvent
      case "AutoRebaseEnabledEvent": return Github.Objects.AutoRebaseEnabledEvent
      case "AutoSquashEnabledEvent": return Github.Objects.AutoSquashEnabledEvent
      case "AutomaticBaseChangeFailedEvent": return Github.Objects.AutomaticBaseChangeFailedEvent
      case "AutomaticBaseChangeSucceededEvent": return Github.Objects.AutomaticBaseChangeSucceededEvent
      case "BaseRefChangedEvent": return Github.Objects.BaseRefChangedEvent
      case "BaseRefDeletedEvent": return Github.Objects.BaseRefDeletedEvent
      case "BaseRefForcePushedEvent": return Github.Objects.BaseRefForcePushedEvent
      case "Blob": return Github.Objects.Blob
      case "Bot": return Github.Objects.Bot
      case "BranchProtectionRule": return Github.Objects.BranchProtectionRule
      case "BypassForcePushAllowance": return Github.Objects.BypassForcePushAllowance
      case "BypassPullRequestAllowance": return Github.Objects.BypassPullRequestAllowance
      case "CWE": return Github.Objects.CWE
      case "CheckRun": return Github.Objects.CheckRun
      case "CheckSuite": return Github.Objects.CheckSuite
      case "ClosedEvent": return Github.Objects.ClosedEvent
      case "CodeOfConduct": return Github.Objects.CodeOfConduct
      case "CommentDeletedEvent": return Github.Objects.CommentDeletedEvent
      case "Commit": return Github.Objects.Commit
      case "CommitComment": return Github.Objects.CommitComment
      case "CommitCommentThread": return Github.Objects.CommitCommentThread
      case "Comparison": return Github.Objects.Comparison
      case "ConnectedEvent": return Github.Objects.ConnectedEvent
      case "ConvertToDraftEvent": return Github.Objects.ConvertToDraftEvent
      case "ConvertedNoteToIssueEvent": return Github.Objects.ConvertedNoteToIssueEvent
      case "ConvertedToDiscussionEvent": return Github.Objects.ConvertedToDiscussionEvent
      case "CrossReferencedEvent": return Github.Objects.CrossReferencedEvent
      case "DemilestonedEvent": return Github.Objects.DemilestonedEvent
      case "DependabotUpdate": return Github.Objects.DependabotUpdate
      case "DependencyGraphManifest": return Github.Objects.DependencyGraphManifest
      case "DeployKey": return Github.Objects.DeployKey
      case "DeployedEvent": return Github.Objects.DeployedEvent
      case "Deployment": return Github.Objects.Deployment
      case "DeploymentEnvironmentChangedEvent": return Github.Objects.DeploymentEnvironmentChangedEvent
      case "DeploymentReview": return Github.Objects.DeploymentReview
      case "DeploymentStatus": return Github.Objects.DeploymentStatus
      case "DisconnectedEvent": return Github.Objects.DisconnectedEvent
      case "Discussion": return Github.Objects.Discussion
      case "DiscussionCategory": return Github.Objects.DiscussionCategory
      case "DiscussionComment": return Github.Objects.DiscussionComment
      case "DiscussionPoll": return Github.Objects.DiscussionPoll
      case "DiscussionPollOption": return Github.Objects.DiscussionPollOption
      case "DraftIssue": return Github.Objects.DraftIssue
      case "Enterprise": return Github.Objects.Enterprise
      case "EnterpriseAdministratorInvitation": return Github.Objects.EnterpriseAdministratorInvitation
      case "EnterpriseIdentityProvider": return Github.Objects.EnterpriseIdentityProvider
      case "EnterpriseMemberInvitation": return Github.Objects.EnterpriseMemberInvitation
      case "EnterpriseRepositoryInfo": return Github.Objects.EnterpriseRepositoryInfo
      case "EnterpriseServerInstallation": return Github.Objects.EnterpriseServerInstallation
      case "EnterpriseServerUserAccount": return Github.Objects.EnterpriseServerUserAccount
      case "EnterpriseServerUserAccountEmail": return Github.Objects.EnterpriseServerUserAccountEmail
      case "EnterpriseServerUserAccountsUpload": return Github.Objects.EnterpriseServerUserAccountsUpload
      case "EnterpriseUserAccount": return Github.Objects.EnterpriseUserAccount
      case "Environment": return Github.Objects.Environment
      case "ExternalIdentity": return Github.Objects.ExternalIdentity
      case "Gist": return Github.Objects.Gist
      case "GistComment": return Github.Objects.GistComment
      case "HeadRefDeletedEvent": return Github.Objects.HeadRefDeletedEvent
      case "HeadRefForcePushedEvent": return Github.Objects.HeadRefForcePushedEvent
      case "HeadRefRestoredEvent": return Github.Objects.HeadRefRestoredEvent
      case "IpAllowListEntry": return Github.Objects.IpAllowListEntry
      case "Issue": return Github.Objects.Issue
      case "IssueComment": return Github.Objects.IssueComment
      case "IssueCommentConnection": return Github.Objects.IssueCommentConnection
      case "IssueCommentEdge": return Github.Objects.IssueCommentEdge
      case "IssueType": return Github.Objects.IssueType
      case "IssueTypeAddedEvent": return Github.Objects.IssueTypeAddedEvent
      case "IssueTypeChangedEvent": return Github.Objects.IssueTypeChangedEvent
      case "IssueTypeRemovedEvent": return Github.Objects.IssueTypeRemovedEvent
      case "Label": return Github.Objects.Label
      case "LabeledEvent": return Github.Objects.LabeledEvent
      case "Language": return Github.Objects.Language
      case "License": return Github.Objects.License
      case "LinkedBranch": return Github.Objects.LinkedBranch
      case "LockedEvent": return Github.Objects.LockedEvent
      case "Mannequin": return Github.Objects.Mannequin
      case "MarkedAsDuplicateEvent": return Github.Objects.MarkedAsDuplicateEvent
      case "MarketplaceCategory": return Github.Objects.MarketplaceCategory
      case "MarketplaceListing": return Github.Objects.MarketplaceListing
      case "MemberFeatureRequestNotification": return Github.Objects.MemberFeatureRequestNotification
      case "MembersCanDeleteReposClearAuditEntry": return Github.Objects.MembersCanDeleteReposClearAuditEntry
      case "MembersCanDeleteReposDisableAuditEntry": return Github.Objects.MembersCanDeleteReposDisableAuditEntry
      case "MembersCanDeleteReposEnableAuditEntry": return Github.Objects.MembersCanDeleteReposEnableAuditEntry
      case "MentionedEvent": return Github.Objects.MentionedEvent
      case "MergeQueue": return Github.Objects.MergeQueue
      case "MergeQueueEntry": return Github.Objects.MergeQueueEntry
      case "MergedEvent": return Github.Objects.MergedEvent
      case "MigrationSource": return Github.Objects.MigrationSource
      case "Milestone": return Github.Objects.Milestone
      case "MilestonedEvent": return Github.Objects.MilestonedEvent
      case "MovedColumnsInProjectEvent": return Github.Objects.MovedColumnsInProjectEvent
      case "OIDCProvider": return Github.Objects.OIDCProvider
      case "OauthApplicationCreateAuditEntry": return Github.Objects.OauthApplicationCreateAuditEntry
      case "OrgAddBillingManagerAuditEntry": return Github.Objects.OrgAddBillingManagerAuditEntry
      case "OrgAddMemberAuditEntry": return Github.Objects.OrgAddMemberAuditEntry
      case "OrgBlockUserAuditEntry": return Github.Objects.OrgBlockUserAuditEntry
      case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return Github.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
      case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return Github.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
      case "OrgCreateAuditEntry": return Github.Objects.OrgCreateAuditEntry
      case "OrgDisableOauthAppRestrictionsAuditEntry": return Github.Objects.OrgDisableOauthAppRestrictionsAuditEntry
      case "OrgDisableSamlAuditEntry": return Github.Objects.OrgDisableSamlAuditEntry
      case "OrgDisableTwoFactorRequirementAuditEntry": return Github.Objects.OrgDisableTwoFactorRequirementAuditEntry
      case "OrgEnableOauthAppRestrictionsAuditEntry": return Github.Objects.OrgEnableOauthAppRestrictionsAuditEntry
      case "OrgEnableSamlAuditEntry": return Github.Objects.OrgEnableSamlAuditEntry
      case "OrgEnableTwoFactorRequirementAuditEntry": return Github.Objects.OrgEnableTwoFactorRequirementAuditEntry
      case "OrgInviteMemberAuditEntry": return Github.Objects.OrgInviteMemberAuditEntry
      case "OrgInviteToBusinessAuditEntry": return Github.Objects.OrgInviteToBusinessAuditEntry
      case "OrgOauthAppAccessApprovedAuditEntry": return Github.Objects.OrgOauthAppAccessApprovedAuditEntry
      case "OrgOauthAppAccessBlockedAuditEntry": return Github.Objects.OrgOauthAppAccessBlockedAuditEntry
      case "OrgOauthAppAccessDeniedAuditEntry": return Github.Objects.OrgOauthAppAccessDeniedAuditEntry
      case "OrgOauthAppAccessRequestedAuditEntry": return Github.Objects.OrgOauthAppAccessRequestedAuditEntry
      case "OrgOauthAppAccessUnblockedAuditEntry": return Github.Objects.OrgOauthAppAccessUnblockedAuditEntry
      case "OrgRemoveBillingManagerAuditEntry": return Github.Objects.OrgRemoveBillingManagerAuditEntry
      case "OrgRemoveMemberAuditEntry": return Github.Objects.OrgRemoveMemberAuditEntry
      case "OrgRemoveOutsideCollaboratorAuditEntry": return Github.Objects.OrgRemoveOutsideCollaboratorAuditEntry
      case "OrgRestoreMemberAuditEntry": return Github.Objects.OrgRestoreMemberAuditEntry
      case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return Github.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
      case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return Github.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
      case "OrgRestoreMemberMembershipTeamAuditEntryData": return Github.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
      case "OrgUnblockUserAuditEntry": return Github.Objects.OrgUnblockUserAuditEntry
      case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return Github.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
      case "OrgUpdateMemberAuditEntry": return Github.Objects.OrgUpdateMemberAuditEntry
      case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return Github.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
      case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return Github.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
      case "Organization": return Github.Objects.Organization
      case "OrganizationIdentityProvider": return Github.Objects.OrganizationIdentityProvider
      case "OrganizationInvitation": return Github.Objects.OrganizationInvitation
      case "OrganizationMigration": return Github.Objects.OrganizationMigration
      case "Package": return Github.Objects.Package
      case "PackageFile": return Github.Objects.PackageFile
      case "PackageTag": return Github.Objects.PackageTag
      case "PackageVersion": return Github.Objects.PackageVersion
      case "ParentIssueAddedEvent": return Github.Objects.ParentIssueAddedEvent
      case "ParentIssueRemovedEvent": return Github.Objects.ParentIssueRemovedEvent
      case "PinnedDiscussion": return Github.Objects.PinnedDiscussion
      case "PinnedEnvironment": return Github.Objects.PinnedEnvironment
      case "PinnedEvent": return Github.Objects.PinnedEvent
      case "PinnedIssue": return Github.Objects.PinnedIssue
      case "PrivateRepositoryForkingDisableAuditEntry": return Github.Objects.PrivateRepositoryForkingDisableAuditEntry
      case "PrivateRepositoryForkingEnableAuditEntry": return Github.Objects.PrivateRepositoryForkingEnableAuditEntry
      case "Project": return Github.Objects.Project
      case "ProjectCard": return Github.Objects.ProjectCard
      case "ProjectColumn": return Github.Objects.ProjectColumn
      case "ProjectV2": return Github.Objects.ProjectV2
      case "ProjectV2Field": return Github.Objects.ProjectV2Field
      case "ProjectV2Item": return Github.Objects.ProjectV2Item
      case "ProjectV2ItemFieldDateValue": return Github.Objects.ProjectV2ItemFieldDateValue
      case "ProjectV2ItemFieldIterationValue": return Github.Objects.ProjectV2ItemFieldIterationValue
      case "ProjectV2ItemFieldNumberValue": return Github.Objects.ProjectV2ItemFieldNumberValue
      case "ProjectV2ItemFieldSingleSelectValue": return Github.Objects.ProjectV2ItemFieldSingleSelectValue
      case "ProjectV2ItemFieldTextValue": return Github.Objects.ProjectV2ItemFieldTextValue
      case "ProjectV2IterationField": return Github.Objects.ProjectV2IterationField
      case "ProjectV2SingleSelectField": return Github.Objects.ProjectV2SingleSelectField
      case "ProjectV2StatusUpdate": return Github.Objects.ProjectV2StatusUpdate
      case "ProjectV2View": return Github.Objects.ProjectV2View
      case "ProjectV2Workflow": return Github.Objects.ProjectV2Workflow
      case "PublicKey": return Github.Objects.PublicKey
      case "PullRequest": return Github.Objects.PullRequest
      case "PullRequestCommit": return Github.Objects.PullRequestCommit
      case "PullRequestCommitCommentThread": return Github.Objects.PullRequestCommitCommentThread
      case "PullRequestCommitConnection": return Github.Objects.PullRequestCommitConnection
      case "PullRequestReview": return Github.Objects.PullRequestReview
      case "PullRequestReviewComment": return Github.Objects.PullRequestReviewComment
      case "PullRequestReviewConnection": return Github.Objects.PullRequestReviewConnection
      case "PullRequestReviewEdge": return Github.Objects.PullRequestReviewEdge
      case "PullRequestReviewThread": return Github.Objects.PullRequestReviewThread
      case "PullRequestThread": return Github.Objects.PullRequestThread
      case "Push": return Github.Objects.Push
      case "PushAllowance": return Github.Objects.PushAllowance
      case "Query": return Github.Objects.Query
      case "Reaction": return Github.Objects.Reaction
      case "ReadyForReviewEvent": return Github.Objects.ReadyForReviewEvent
      case "Ref": return Github.Objects.Ref
      case "ReferencedEvent": return Github.Objects.ReferencedEvent
      case "Release": return Github.Objects.Release
      case "ReleaseAsset": return Github.Objects.ReleaseAsset
      case "RemovedFromMergeQueueEvent": return Github.Objects.RemovedFromMergeQueueEvent
      case "RemovedFromProjectEvent": return Github.Objects.RemovedFromProjectEvent
      case "RenamedTitleEvent": return Github.Objects.RenamedTitleEvent
      case "ReopenedEvent": return Github.Objects.ReopenedEvent
      case "RepoAccessAuditEntry": return Github.Objects.RepoAccessAuditEntry
      case "RepoAddMemberAuditEntry": return Github.Objects.RepoAddMemberAuditEntry
      case "RepoAddTopicAuditEntry": return Github.Objects.RepoAddTopicAuditEntry
      case "RepoArchivedAuditEntry": return Github.Objects.RepoArchivedAuditEntry
      case "RepoChangeMergeSettingAuditEntry": return Github.Objects.RepoChangeMergeSettingAuditEntry
      case "RepoConfigDisableAnonymousGitAccessAuditEntry": return Github.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
      case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return Github.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
      case "RepoConfigDisableContributorsOnlyAuditEntry": return Github.Objects.RepoConfigDisableContributorsOnlyAuditEntry
      case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return Github.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
      case "RepoConfigEnableAnonymousGitAccessAuditEntry": return Github.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
      case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return Github.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
      case "RepoConfigEnableContributorsOnlyAuditEntry": return Github.Objects.RepoConfigEnableContributorsOnlyAuditEntry
      case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return Github.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
      case "RepoConfigLockAnonymousGitAccessAuditEntry": return Github.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
      case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return Github.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
      case "RepoCreateAuditEntry": return Github.Objects.RepoCreateAuditEntry
      case "RepoDestroyAuditEntry": return Github.Objects.RepoDestroyAuditEntry
      case "RepoRemoveMemberAuditEntry": return Github.Objects.RepoRemoveMemberAuditEntry
      case "RepoRemoveTopicAuditEntry": return Github.Objects.RepoRemoveTopicAuditEntry
      case "Repository": return Github.Objects.Repository
      case "RepositoryInvitation": return Github.Objects.RepositoryInvitation
      case "RepositoryMigration": return Github.Objects.RepositoryMigration
      case "RepositoryRule": return Github.Objects.RepositoryRule
      case "RepositoryRuleset": return Github.Objects.RepositoryRuleset
      case "RepositoryRulesetBypassActor": return Github.Objects.RepositoryRulesetBypassActor
      case "RepositoryTopic": return Github.Objects.RepositoryTopic
      case "RepositoryVisibilityChangeDisableAuditEntry": return Github.Objects.RepositoryVisibilityChangeDisableAuditEntry
      case "RepositoryVisibilityChangeEnableAuditEntry": return Github.Objects.RepositoryVisibilityChangeEnableAuditEntry
      case "RepositoryVulnerabilityAlert": return Github.Objects.RepositoryVulnerabilityAlert
      case "ReviewDismissalAllowance": return Github.Objects.ReviewDismissalAllowance
      case "ReviewDismissedEvent": return Github.Objects.ReviewDismissedEvent
      case "ReviewRequest": return Github.Objects.ReviewRequest
      case "ReviewRequestRemovedEvent": return Github.Objects.ReviewRequestRemovedEvent
      case "ReviewRequestedEvent": return Github.Objects.ReviewRequestedEvent
      case "SavedReply": return Github.Objects.SavedReply
      case "SearchResultItemConnection": return Github.Objects.SearchResultItemConnection
      case "SecurityAdvisory": return Github.Objects.SecurityAdvisory
      case "SponsorsActivity": return Github.Objects.SponsorsActivity
      case "SponsorsListing": return Github.Objects.SponsorsListing
      case "SponsorsListingFeaturedItem": return Github.Objects.SponsorsListingFeaturedItem
      case "SponsorsTier": return Github.Objects.SponsorsTier
      case "Sponsorship": return Github.Objects.Sponsorship
      case "SponsorshipNewsletter": return Github.Objects.SponsorshipNewsletter
      case "Status": return Github.Objects.Status
      case "StatusCheckRollup": return Github.Objects.StatusCheckRollup
      case "StatusContext": return Github.Objects.StatusContext
      case "SubIssueAddedEvent": return Github.Objects.SubIssueAddedEvent
      case "SubIssueRemovedEvent": return Github.Objects.SubIssueRemovedEvent
      case "SubscribedEvent": return Github.Objects.SubscribedEvent
      case "Tag": return Github.Objects.Tag
      case "Team": return Github.Objects.Team
      case "TeamAddMemberAuditEntry": return Github.Objects.TeamAddMemberAuditEntry
      case "TeamAddRepositoryAuditEntry": return Github.Objects.TeamAddRepositoryAuditEntry
      case "TeamChangeParentTeamAuditEntry": return Github.Objects.TeamChangeParentTeamAuditEntry
      case "TeamDiscussion": return Github.Objects.TeamDiscussion
      case "TeamDiscussionComment": return Github.Objects.TeamDiscussionComment
      case "TeamRemoveMemberAuditEntry": return Github.Objects.TeamRemoveMemberAuditEntry
      case "TeamRemoveRepositoryAuditEntry": return Github.Objects.TeamRemoveRepositoryAuditEntry
      case "Topic": return Github.Objects.Topic
      case "TransferredEvent": return Github.Objects.TransferredEvent
      case "Tree": return Github.Objects.Tree
      case "UnassignedEvent": return Github.Objects.UnassignedEvent
      case "UnlabeledEvent": return Github.Objects.UnlabeledEvent
      case "UnlockedEvent": return Github.Objects.UnlockedEvent
      case "UnmarkedAsDuplicateEvent": return Github.Objects.UnmarkedAsDuplicateEvent
      case "UnpinnedEvent": return Github.Objects.UnpinnedEvent
      case "UnsubscribedEvent": return Github.Objects.UnsubscribedEvent
      case "User": return Github.Objects.User
      case "UserBlockedEvent": return Github.Objects.UserBlockedEvent
      case "UserContentEdit": return Github.Objects.UserContentEdit
      case "UserList": return Github.Objects.UserList
      case "UserNamespaceRepository": return Github.Objects.UserNamespaceRepository
      case "UserStatus": return Github.Objects.UserStatus
      case "VerifiableDomain": return Github.Objects.VerifiableDomain
      case "Workflow": return Github.Objects.Workflow
      case "WorkflowRun": return Github.Objects.WorkflowRun
      case "WorkflowRunFile": return Github.Objects.WorkflowRunFile
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}