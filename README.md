# Pullse [![CI](https://github.com/winebarrel/Pullse/actions/workflows/ci.yml/badge.svg)](https://github.com/winebarrel/Pullse/actions/workflows/ci.yml)

[![](https://github.com/user-attachments/assets/e5fdb92f-a996-476f-8bb0-aa05c2b7d447)](https://apps.apple.com/app/pullse/id6744265414)

Pullse is a utility app that notifies you of GitHub Pull Requests that have been approved or failed testing.

## Download

https://github.com/winebarrel/Pullse/releases/latest

## Features

### Show pull requests from menu bar

![](https://github.com/user-attachments/assets/fb9891cb-6a08-4913-afbd-9b92f9dd6c35)
![](https://github.com/user-attachments/assets/3c79c958-7af5-4f1f-a348-c77f6fec4b98)

### Notification of settled pull requests

![](https://github.com/user-attachments/assets/0a093f12-5b39-492c-b5f6-d6dc6e779f27)

### Status indication by menu bar icons

| Icon | Status |
| - | - |
| ![](https://github.com/user-attachments/assets/f33caee2-a819-40cd-8378-e50759d19e39) | No settled pull requests |
| ![](https://github.com/user-attachments/assets/e9ea6172-d90f-47cc-a9e4-8041755616a4) | All pull requests approved and passed testing |
| ![](https://github.com/user-attachments/assets/776a93f9-2e75-4a9a-9a35-dbc8131c7382) | Pull request test fails |


## Configuration

**Right-click menu** > **Settings**:

![](https://github.com/user-attachments/assets/d44de716-556b-4f0e-be98-0fa3287cf105)
![](https://github.com/user-attachments/assets/8977cdcf-4c27-4878-89b1-95dcc5330b81)

| Field | Value |
| - | - |
| GitHub token  | Token with repo scope.<br>Create from https://github.com/settings/tokens/new?scopes=repo |
| Search query  | Pull request search query.<br>See https://docs.github.com/search-github/searching-on-github/searching-issues-and-pull-requests |
| Interval (sec)| Pull request fetch interval. (second) |

### "OR" in query

Enclose words in curly brackets (`{..}`) to search as `OR`.

```
is:open is:pr { author:@me assignee:@me } archived:false
```

## Note

App icon from https://icon.kitchen

