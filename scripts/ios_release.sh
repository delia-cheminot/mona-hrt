#!/usr/bin/env bash
set -euo pipefail

REPO="mona-hrt/mona"
MIN_OS="13.0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Temp working dir, cleaned up on exit. Global so the EXIT trap can reach it
# after main() returns (a local would be out of scope under `set -u`).
WORKDIR=""
cleanup() { [[ -n "$WORKDIR" ]] && rm -rf "$WORKDIR"; }
trap cleanup EXIT

die() { echo "error: $*" >&2; exit 1; }

preflight() {
  command -v jq >/dev/null 2>&1 || die "jq is required but not installed"
  command -v gh >/dev/null 2>&1 || die "gh (GitHub CLI) is required but not installed"
  gh auth status >/dev/null 2>&1 || die "gh is not authenticated. run 'gh auth login'"
}

read_version() {
  local line
  line="$(grep -m1 '^version:' "${REPO_ROOT}/pubspec.yaml")" \
    || die "no 'version:' line in pubspec.yaml"
  if [[ "$line" =~ ^version:\ *([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+) ]]; then
    echo "${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
  else
    die "could not parse 'version: X.Y.Z+B' from: $line"
  fi
}

read_changelog() {
  local build="$1"
  local file="${REPO_ROOT}/fastlane/metadata/android/en-US/changelogs/${build}.txt"
  [[ -f "$file" ]] || die "changelog not found: $file"
  cat "$file"
}

find_latest_archive() {
  local base="${HOME}/Library/Developer/Xcode/Archives"
  [[ -d "$base" ]] || die "no Xcode archives directory at $base"
  local latest
  latest="$(find "$base" -maxdepth 2 -name '*.xcarchive' -print0 2>/dev/null \
    | xargs -0 stat -f '%m %N' 2>/dev/null \
    | sort -rn \
    | { read -r first || true; echo "${first#* }"; })"
  [[ -n "$latest" ]] || die "no .xcarchive found under $base. run Product > Archive first"
  echo "$latest"
}

archive_app_path() {
  local archive="$1"
  local app="${archive}/Products/Applications/Runner.app"
  [[ -d "$app" ]] || die "Runner.app not found in archive: $app"
  [[ -d "${app}/_CodeSignature" ]] \
    || die "Runner.app is unsigned (no _CodeSignature). use an Xcode archive, not --no-codesign"
  echo "$app"
}

file_size() {
  stat -f%z "$1"
}

build_ipa() {
  local app_path="$1" version="$2" workdir="$3"
  local payload="${workdir}/Payload"
  local ipa="${workdir}/mona-${version}.ipa"
  rm -rf "$payload" "$ipa"
  mkdir -p "$payload"
  cp -R "$app_path" "${payload}/Runner.app"
  ( cd "$workdir" && zip -qr "mona-${version}.ipa" Payload )
  [[ -f "$ipa" ]] || die "failed to create ipa: $ipa"
  echo "$ipa"
}

verify_release() {
  local tag="$1"
  gh release view "$tag" --repo "$REPO" >/dev/null 2>&1 \
    || die "release $tag not found on $REPO. run the Android release (which creates the tag/release) first"
}

verify_not_published() {
  local version="$1"
  local json="${REPO_ROOT}/ios_source.json"
  if jq -e --arg v "$version" \
       '.apps[0].versions[] | select(.version == $v)' "$json" >/dev/null; then
    die "version $version already present in ios_source.json"
  fi
}

upload_ipa() {
  local tag="$1" ipa="$2"
  gh release upload "$tag" "$ipa" --repo "$REPO" --clobber
}

update_source_json() {
  local version="$1" build="$2" size="$3" date="$4" download_url="$5" changelog_file="$6"
  local json="${REPO_ROOT}/ios_source.json"
  local tmp
  tmp="$(mktemp "${json}.XXXXXX")"

  # guard against duplicate re-runs.
  if jq -e --arg v "$version" \
       '.apps[0].versions[] | select(.version == $v)' "$json" >/dev/null; then
    rm -f "$tmp"
    die "version $version already present in ios_source.json"
  fi

  jq \
    --arg version "$version" \
    --arg build "$build" \
    --argjson size "$size" \
    --arg date "$date" \
    --arg url "$download_url" \
    --arg minos "$MIN_OS" \
    --rawfile notes "$changelog_file" \
    '
    ($notes | sub("\n+$"; "")) as $desc
    | .apps[0] as $app
    | ($app.versions
        | [ {
              downloadURL: $url,
              size: $size,
              version: $version,
              buildVersion: $build,
              date: $date,
              localizedDescription: $desc,
              minOSVersion: $minos
            } ] + .) as $newversions
    | .apps[0].downloadURL = $url
    | .apps[0].size = $size
    | .apps[0].version = $version
    | .apps[0].versionDate = $date
    | .apps[0].versionDescription = $desc
    | .apps[0].versions = $newversions
    ' "$json" > "$tmp" || { rm -f "$tmp"; die "jq failed to edit ios_source.json"; }

  mv "$tmp" "$json"
}

push_remote_for() {
  local repo="$1" name url
  while read -r name url _; do
    [[ "$url" == *"$repo"* ]] && { echo "$name"; return 0; }
  done < <(git -C "$REPO_ROOT" remote -v | grep '(push)')
  die "no git remote points at $repo. add one, e.g. 'git remote add mona https://github.com/${repo}.git'"
}

commit_and_push() {
  local remote="$1"
  git -C "$REPO_ROOT" add ios_source.json
  git -C "$REPO_ROOT" commit -m "chore: update ios source" -- ios_source.json
  git -C "$REPO_ROOT" push "$remote" HEAD
}

main() {
  preflight

  local version build
  read version build < <(read_version)
  local tag="v${version}"

  local archive app_path
  archive="$(find_latest_archive)"
  app_path="$(archive_app_path "$archive")"

  local changelog_file="${REPO_ROOT}/fastlane/metadata/android/en-US/changelogs/${build}.txt"
  [[ -f "$changelog_file" ]] || die "changelog not found: $changelog_file"

  # Recap + confirmation.
  echo "About to publish iOS release:"
  echo "  version:  ${version} (build ${build})  →  tag ${tag}"
  echo "  archive:  ${archive}"
  echo "  app:      ${app_path}"
  echo "  repo:     ${REPO}"
  echo "  ---- changelog ----"
  sed 's/^/  /' "$changelog_file"
  echo "  -------------------"
  read -r -p "Proceed? [y/N] " reply
  [[ "$reply" =~ ^[Yy]$ ]] || die "aborted by user"

  # Fail fast before any mutation.
  verify_release "$tag"
  verify_not_published "$version"
  local remote
  remote="$(push_remote_for "$REPO")"

  # Build the ipa in a temp dir cleaned up on exit (see WORKDIR/cleanup above).
  WORKDIR="$(mktemp -d)"

  local ipa size download_url date
  ipa="$(build_ipa "$app_path" "$version" "$WORKDIR")"
  size="$(file_size "$ipa")"
  date="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  download_url="https://github.com/${REPO}/releases/download/${tag}/mona-${version}.ipa"

  echo "Uploading ${ipa} (${size} bytes) to ${tag}..."
  upload_ipa "$tag" "$ipa"

  echo "Updating ios_source.json..."
  update_source_json "$version" "$build" "$size" "$date" "$download_url" "$changelog_file"

  echo "Committing and pushing ios_source.json to ${remote}..."
  commit_and_push "$remote"

  echo "Done: ${tag} published, ipa uploaded, ios_source.json pushed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
