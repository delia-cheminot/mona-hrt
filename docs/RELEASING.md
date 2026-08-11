# Releasing

This document is intended for maintainers and explains how to push a new version of Mona.

## Prerequisites



## Versioning

Mona follows [Semantic Versioning](https://semver.org/) (`MAJOR.MINOR.PATCH`), combined with a Flutter build number (`+N`) used by the stores as `versionCode` (Android) / `CFBundleVersion` (iOS):

```
v<MAJOR>.<MINOR>.<PATCH>+<BUILD_NUMBER>
```

Rules:

- **MAJOR** — incompatible changes (data model, breaking UX changes, etc.).
- **MINOR** — new features, backwards-compatible.
- **PATCH** — bug fixes only.
- **BUILD_NUMBER** — must be incremented on **every** released build, even for the same version name. Stores reject re-uploads with an existing build number.

> [!IMPORTANT]
> **Do not bump the version manually.** The `version:` field in [`pubspec.yaml`](../pubspec.yaml) and `MARKETING_VERSION` in `ios/Runner.xcodeproj/project.pbxproj` are written automatically by the release CI. See [Release Steps](#release-steps).

## Release Steps

A new version is published by merging a Pull Request from `dev` to `main`. The [`CI - release`](../.github/workflows/ci-release.yml) workflow then bumps the version files, writes the Fastlane changelog, commits, tags `v<X>.<Y>.<Z>`, builds the Android artifacts and creates the GitHub Release.

1. **Open a release PR** from `dev` to `main` with a title of the form:

   ```
   v<MAJOR>.<MINOR>.<PATCH>+<BUILD_NUMBER>
   ```

   for example `v1.10.2+11`. The title is the **only** source of truth for the version, pick it according to the [Versioning](#versioning) rules.

2. **Fill the PR body** with the release notes. They will be used as-is, in plain text, for both the GitHub Release and the Fastlane / IzzyOnDroid changelog.

   Constraints:

   - ≤ 500 bytes (IzzyOnDroid limit, enforced by CI).
   - No Markdown formatting, what you write is what users will see.

3. **Merge the PR.** The `CI - release` workflow runs automatically and performs all the version bump / tag / build / release steps. Once it finishes, follow the [Post-release](#post-release) steps to publish on the stores.

> [!NOTE]
> If the PR-based flow is not usable (e.g. the workflow needs to be re-run), the same release can be triggered manually via `workflow_dispatch` on `CI - release`, by providing `version`, `build_number` and `release_notes` inputs.

## Post-release

The CI automatically publishes the GitHub Release and tags the commit. Store uploads must still be done by hand.

### Android (Google Play)

The `build_android_store` job uploads the signed App Bundle as a workflow artifact named `android-release-aab-store`, containing `mona-<VERSION>.aab`.

1. Open the completed `CI - release` run on GitHub Actions and download the `android-release-aab-store` artifact.

   > [!WARNING]
   > Artifacts are retained for **7 days** only. Download the AAB before it expires, or you will need to re-run the build.

2. Unzip it to get `mona-<VERSION>.aab`.
3. In the [Google Play Console](https://play.google.com/console), open the Mona app and create a new release on the relevant track (production / closed testing / etc.).
4. Upload `mona-<VERSION>.aab` as the release artifact.
5. Paste the release PR body as the Play Store release notes (same content as the GitHub Release / Fastlane changelog).
6. Set the rollout to **100%** (no staged rollout).
7. Review and roll out the release.

### iOS (App Store)

iOS builds are **not** produced by CI, they must be archived locally on a Mac with Xcode and a valid Apple Developer signing setup. The version files have already been bumped on `main` by the release workflow, so make sure your local checkout is up to date with the release tag before building.

1. From the repository root, build the iOS release:

   ```bash
   fvm flutter build ios --release
   ```

2. Open the iOS project in Xcode:

   ```bash
   open ios/Runner.xcworkspace
   ```

3. In Xcode, select the `Runner` scheme and the **Any iOS Device (arm64)** destination, then choose **Product > Archive**.
4. When the archive completes, the **Organizer** opens. Select the new archive and click **Validate App**, then fix any signing/metadata issues Xcode reports.
5. Once validation passes, click **Distribute App** and upload the build to App Store Connect.
6. In [App Store Connect](https://appstoreconnect.apple.com/), open the Mona app, create a new version matching `<MAJOR>.<MINOR>.<PATCH>`, and select the build you just uploaded once it has finished processing.
7. Fill in the **What's New in This Version** field with the release PR body (same content as the GitHub Release).
8. Submit the version for App Store review.

### iOS sideload (AltStore / SideStore source)

Mona also reaches iOS users outside the App Store through an AltStore-compatible source ([`ios_source.json`](../ios_source.json)). Each release ships a signed `.ipa` attached to the GitHub Release, and the source file points to it.

The [`scripts/ios_release.sh`](../scripts/ios_release.sh) script does all of this. It repackages the Xcode archive as an `.ipa`, uploads it to the GitHub Release, updates `ios_source.json`, and pushes the change.

Prerequisites:

- The Xcode archive from the App Store section exists.
- The GitHub Release for `v<VERSION>` exists.
- `jq` and the GitHub CLI (`gh`) are installed, and `gh` is authenticated.

Run the script from the repository root:

```bash
scripts/ios_release.sh
```
