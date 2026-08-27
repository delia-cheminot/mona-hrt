#!/usr/bin/env bash
# Generates in-app store screenshots for each mapped language.
#
# Usage:
#   scripts/screenshots.sh [--platform android|ios|all] [--locale <appTag>]
#
# Env overrides:
#   SCREENSHOT_ANDROID_DEVICE  adb device id (default: first attached device)
#   SCREENSHOT_IOS_DEVICE      simulator name (default: "iPhone 16 Pro Max")

set -euo pipefail

PLATFORM="all"
ONLY_LOCALE=""

while [ $# -gt 0 ]; do
  case "$1" in
    --platform) PLATFORM="$2"; shift 2 ;;
    --locale)   ONLY_LOCALE="$2"; shift 2 ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

MAP="fastlane/screenshot_locales.json"
TARGET="tool/screenshots/screenshots.dart"
DRIVER="test_driver/screenshots_driver.dart"

[ -f "$MAP" ] || { echo "Missing locale map: $MAP" >&2; exit 1; }
jq -e . "$MAP" >/dev/null 2>&1 || { echo "Malformed locale map: $MAP" >&2; exit 1; }

# Read the app-locale tags, optionally filtered to one.
APP_TAGS=()
while IFS= read -r tag; do
  APP_TAGS+=("$tag")
done < <(jq -r '.[].app' "$MAP")

resolve_ios_udid() {
  local name="${SCREENSHOT_IOS_DEVICE:-iPhone 16 Pro Max}"
  local udid
  udid=$(xcrun simctl list devices available --json \
    | jq -r --arg n "$name" \
      '.devices | to_entries[] | .value[] | select(.name==$n) | .udid' \
    | head -n1) || true
  [ -n "$udid" ] || { echo "No available iOS simulator named '$name'." >&2; exit 1; }
  xcrun simctl boot "$udid" >/dev/null 2>&1 || true
  echo "$udid"
}

resolve_android_device() {
  local dev="${SCREENSHOT_ANDROID_DEVICE:-}"
  if [ -z "$dev" ]; then
    dev=$(adb devices | awk 'NR>1 && $2=="device"{print $1; exit}')
  fi
  [ -n "$dev" ] || { echo "No Android device. Start an emulator first." >&2; exit 1; }
  echo "$dev"
}

drive_one() {
  local platform="$1" app_tag="$2" device="$3"; shift 3
  local out="build/screenshots/$platform/$app_tag"
  rm -rf "$out"; mkdir -p "$out"
  echo "==> $platform / $app_tag"
  SCREENSHOT_OUT="$out" fvm flutter drive \
    --driver="$DRIVER" \
    --target="$TARGET" \
    -d "$device" \
    --dart-define=SCREENSHOT_LOCALE="$app_tag" \
    "$@"
}

run_platform() {
  local platform="$1"
  local device
  local flavor_args=()
  if [ "$platform" = "android" ]; then
    device="$(resolve_android_device)"
    flavor_args=(--flavor store)
  else
    device="$(resolve_ios_udid)"
    # iOS: default scheme until a `store` scheme exists in Xcode.
    flavor_args=()
  fi

  for app_tag in ${APP_TAGS[@]+"${APP_TAGS[@]}"}; do
    [ -n "$ONLY_LOCALE" ] && [ "$app_tag" != "$ONLY_LOCALE" ] && continue

    local store_tag
    if [ "$platform" = "android" ]; then
      store_tag=$(jq -r --arg a "$app_tag" '.[] | select(.app==$a) | .play' "$MAP")
    else
      store_tag=$(jq -r --arg a "$app_tag" '.[] | select(.app==$a) | .appstore' "$MAP")
    fi

    if [ "$store_tag" = "null" ] || [ -z "$store_tag" ]; then
      echo "-- skip $platform / $app_tag (no store locale)"
      continue
    fi

    drive_one "$platform" "$app_tag" "$device" ${flavor_args[@]+"${flavor_args[@]}"}

    local dest
    if [ "$platform" = "android" ]; then
      dest="fastlane/metadata/android/$store_tag/images/phoneScreenshots"
    else
      dest="fastlane/screenshots/$store_tag"
    fi
    rm -rf "$dest"; mkdir -p "$dest"
    cp build/screenshots/"$platform"/"$app_tag"/*.png "$dest"/
    echo "-- copied $platform / $app_tag -> $dest"
  done
}

case "$PLATFORM" in
  android) run_platform android ;;
  ios)     run_platform ios ;;
  all)     run_platform android; run_platform ios ;;
  *) echo "Unknown platform: $PLATFORM" >&2; exit 2 ;;
esac

echo "Done."
