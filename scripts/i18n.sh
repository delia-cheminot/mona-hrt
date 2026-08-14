#!/usr/bin/env bash
# Regenerates i18n Dart code from lib/i18n/*.i18next.json.

set -euo pipefail

cd "$(dirname "$0")/.."

fvm dart run tool/i18next_to_slang.dart
fvm dart run slang
fvm dart run tool/i18next_to_android_widget_res.dart
