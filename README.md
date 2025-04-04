# Pullse

[![CI](https://github.com/winebarrel/Pullse/actions/workflows/ci.yml/badge.svg)](https://github.com/winebarrel/Pullse/actions/workflows/ci.yml)

Pullse is a utility app that notifies you of GitHub Pull Requests that have been approved or failed testing.

## Download

https://github.com/winebarrel/Pullse/releases/latest

## Features

### Show pull requests in menu bar

![](https://github.com/user-attachments/assets/1b7601ec-7820-454b-9165-63cc771e72b2)
![](https://github.com/user-attachments/assets/8af168dd-30fd-4e57-8c75-1fd491bc60ad)

### Notification of settled pull requests

![](https://github.com/user-attachments/assets/db6a9167-c9ef-4874-a1cf-5380f1b02d17)

### Status indication by menu bar icons

| Icon | Status |
| - | - |
| ![](https://github.com/user-attachments/assets/f33caee2-a819-40cd-8378-e50759d19e39) | No settled pull requests |
| ![](https://github.com/user-attachments/assets/e9ea6172-d90f-47cc-a9e4-8041755616a4) | All pull requests approved and passed testing |
| ![](https://github.com/user-attachments/assets/776a93f9-2e75-4a9a-9a35-dbc8131c7382) | Pull request test fails |


## Configuration

**Right-click menu** > **Settings**:

![](https://github.com/user-attachments/assets/5f72bf13-71d7-481d-a657-35617ec13c2c)
![](https://github.com/user-attachments/assets/ef9f0d74-6286-414c-9092-98af2d07182e)

| Field | Value |
| - | - |
| GitHub token | Token with repo scope.<br>Create from https://github.com/settings/tokens/new?scopes=repo |
| Search query| Pull request search query.<br>See https://docs.github.com/search-github/searching-on-github/searching-issues-and-pull-requests |

### "OR" in query

Enclose words in curly brackets (`{..}`) to search as `OR`.

```
is:open is:pr { author:@me assignee:@me } archived:false
```

## Note

App icon from https://icon.kitchen

