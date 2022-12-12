# .NET Setup

![License: MIT][shield-license-mit]
[![CI][shield-ci]][workflow-ci]
[![Ubuntu][shield-platform-ubuntu]][job-runs-on]
[![macOS][shield-platform-macos]][job-runs-on]
[![Windows][shield-platform-windows]][job-runs-on]

A GitHub Action that wraps the .NET CLI `dotnet restore` command. 

## Features

- Wraps the `dotnet restore` [.NET CLI][dotnet-sdk] command
  - Provides a structured way of using this command in a workflow
- Supports all platforms (Linux, macOS, Windows)

> **Note**
>
> This action provides a wrapper around the `dotnet restore` [.NET CLI][dotnet-sdk] command. 
> For further details, please check out the [official documentation][dotnet-restore].

## Usage

### Restore Packages

```yaml
steps:
  - ...
  - name: .NET Restore
    uses: zyactions/dotnet-restore@master
```

The `dotnet restore` command automatically searches for a Visual Studio Solution file (`*.sln`) in the repository root.

### Restore Packages for a specific Project- or Solution

```yaml
steps:
  - ...
  - name: .NET Restore
    uses: zyactions/dotnet-restore@master
    with:
      workspace: tests/Tests.sln
```

## Inputs

### `workspace`

The Visual Studio workspace (directory, project- or solution-file).

The `dotnet restore` command automatically searches for a Visual Studio Solution file (`*.sln`) in the specified workspace directory, if no explicit solution- or project- file is specified.

Example values:

- `path/to/workspace`
- `path/to/Solution.sln`
- `path/to/Project.csproj`

### `configfile`

The NuGet configuration file (nuget.config) to use. If specified, only the settings from this file will be used. If not specified, the hierarchy of configuration files from the current directory will be used. 
For more information, see [Common NuGet Configurations][nuget-configurations].

### `ignore-failed-sources`

Only warn about failed sources if there are packages meeting the version requirement.

### `force`

Forces all dependencies to be resolved even if the last restore was successful. Specifying this flag is the same as deleting the `project.assets.json` file.

### `force-evaluate`

Forces `restore` to reevaluate all dependencies even if a lock file already exists.

### `use-lock-file`

Enables project lock file to be generated and used with restore.

### `lock-file-path`

Output location where project lock file is written. By default, this is `PROJECT_ROOT\packages.lock.json`.

### `locked-mode`

Don't allow updating project lock file. This is useful when deterministic builds are required.

## Requirements

The [.NET CLI][dotnet-sdk] needs to be installed on the runner. To be independent from the GitHub defaults, it's recommended to install a specific version of the SDK prior to calling this action.

To install the .NET SDK in your workflow, the following actions can be used:

- [zyactions/dotnet-setup][zyactions-dotnet-setup]
- [actions/setup-dotnet][actions-setup-dotnet]

## Dependencies

This action does not use external dependencies.

## Versioning

Versions follow the [semantic versioning scheme][semver].

## License

.NET Restore Action is licensed under the MIT license.

[actions-setup-dotnet]: https://github.com/actions/setup-dotnet
[dotnet-restore]: https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-restore
[dotnet-sdk]: https://github.com/dotnet/sdk
[job-runs-on]: https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on
[nuget-configurations]: https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior
[semver]:https://semver.org
[shield-license-mit]: https://img.shields.io/badge/License-MIT-blue.svg
[shield-ci]: https://github.com/zyactions/dotnet-restore/actions/workflows/ci.yml/badge.svg
[shield-platform-ubuntu]: https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu\&logoColor=white
[shield-platform-macos]: https://img.shields.io/badge/macOS-53C633?logo=apple\&logoColor=white
[shield-platform-windows]: https://img.shields.io/badge/Windows-0078D6?logo=windows\&logoColor=white
[workflow-ci]: https://github.com/zyactions/dotnet-restore/actions/workflows/ci.yml
[zyactions-dotnet-setup]: https://github.com/zyactions/dotnet-setup
