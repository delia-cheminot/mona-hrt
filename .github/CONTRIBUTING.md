# Contributing to Mona

First off, thank you for considering contributing to Mona! We welcome all forms of contributions—whether it's fixing bugs, adding new features, improving documentation, or reporting issues.

This document outlines the process and guidelines for contributing to this project.

## Development Workflow

We use a standard **Fork and Pull Request** workflow. To keep our main branch stable, **all pull requests from external contributors must target the `dev` branch**.

### 1. Fork & Clone

1. Fork this repository to your own GitHub account.
2. Clone your forked repository to your local machine:
  ```bash
   git clone https://github.com/YOUR-USERNAME/mona-hrt.git
   cd mona-hrt
   git checkout dev
  ```

### 2. Set Up the Environment

**Linux / macOS**

We have provided a script to automatically set up FVM, configure your shell, and fetch the necessary dependencies.

```bash
chmod +x scripts/setup_dev.sh
./scripts/setup_dev.sh
```

> [!NOTE]
> After running the script, you may need to restart your terminal or run `source ~/.bashrc` (or `~/.zshrc`) to use the FVM commands.

**NixOS**

The repo ships a `flake.nix` with a ready-made dev shell. The only system-level requirement is `programs.nix-ld.enable = true` in your NixOS configuration, which lets FVM's pre-built Dart binaries run.

Enter the shell with `nix develop` (or `direnv allow` if you use direnv), then `fvm flutter run` works as usual.

**Windows**

```powershell
./scripts/setup_dev.ps1
```

### 3. Create a Feature Branch

Create a new branch for your feature or bug fix based on `dev`. Please use descriptive names:

```bash
# or
git checkout -b fix/annoying-bug
```

### 4. Running the App

Because the project uses FVM, you must prefix all standard Flutter commands with fvm. This ensures you are using the pinned SDK rather than your system's global Flutter installation.

```bash
# Get dependencies
fvm flutter pub get

# Run the app
fvm flutter run --flavor standalone

# Run tests
fvm flutter test
```

> [!TIP]
> If you use VS Code, the repository includes a `.vscode/settings.json` file that automatically points the IDE to the FVM SDK. If you use Android Studio or IntelliJ IDEA, please set your Flutter SDK path to `[project_root]/.fvm/flutter_sdk` in `File > Settings > Languages & Frameworks > Flutter`.

## Dependency Rules

**Do not** run `fvm flutter pub upgrade`. When fetching packages, only use `fvm flutter pub get`. This respects the `pubspec.lock` file and ensures your local environment matches the exact dependency versions used by the maintainers. If a dependency needs to be updated, it should be done in a dedicated, isolated Pull Request.

## Submitting your Pull Request

Once your changes are ready and tested locally:

1. Commit your changes with clear, descriptive commit messages.
2. Push your branch to your forked repository:
  ```bash
   git push origin your-branch-name
  ```
3. Go to the original Mona repository on GitHub and click **New Pull Request**.
4. Set the base branch to `dev` and the compare branch to your feature branch.
5. Fill out the PR description, detailing what you changed and why.
6. Make sure all the checks pass, and correct potential errors.

It is strongly recommended to have an issue linked to your PR especially for bug fixes.

## Need Help?

If you need any help setting up your environment or understanding the codebase, please join [Mona's Discord server](https://discord.gg/qsHzkX89vJ).

## Found a bug ?

If you find a bug in the source code, you can help us by [submitting an issue](https://github.com/delia-cheminot/mona-hrt/issues) to our GitHub Repository. Even better, you can submit a Pull Request with a fix!

### Before creating an issue

Before creating an issue look for already existing issues similar to yours. Maybe the issue is already known and being discussed, or it is not an issue at all.

### Creating a new issue

To help us identify and fix issues faster, please follow this template :

- Describe the bug clearly and concisely. What went wrong ?
- Steps to reproduce : list exactly what you did before the bug appeared.
- Expected vs. Actual behavior : What did you expect to happen ? What happened ?
- The version of the app (Android/iOS and version number)

If possible, include screenshots, recordings, or error messages -- anything that can help us understand the issue. 

## You have an idea or suggestion ?

Any new idea or suggestion is welcome !  
Here's how you can bring your ideas and suggestions to Mona :
Open a new issue, where you explain your idea or suggestion. What does it bring to the application, how does it work, where did you source your information (if needed, for example for an algorithm) ... The team will review your issue, discuss with you about it, and accept it if they like it !

## Conventions

### Branch name

The name of the branches you create must follow this pattern : `<type>/<short name>`.  
`type` is one of the following : 


| type  | description                                             |
| ----- | ------------------------------------------------------- |
| feat  | when adding new features                                |
| fix   | when fixing a bug                                       |
| doc   | when documenting the app                                |
| build | when changing how to build the app, or dependencies     |
| ci    | when changing the CI/CD scripts                         |
| chore | when changing the code without altering functionalities |


The short name is one or a few words that quickly tells what the branch will bring to the project. Example : `feat/add-multi-notification`.

### Commits

Your commits should also follow a specific pattern : 

```
<type>: <short description>

<more details (optional)>
```

For example :

```
feat: enable multiple notification settings

implement UI and rework notification service
```

You are free to do whatever you want on your branches. Once you deem your work finished, please go back on them to tidy your history of commits so that you have only meaningful commits that do not break the app and CICD when checked out individually. 

Thank you for helping make Mona better!