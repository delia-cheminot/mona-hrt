#!/usr/bin/env bash
# Regenerates i18n Dart code from lib/i18n/*.i18next.json.
#
# Step 1: convert Weblate's i18next JSON to slang's JSON input format.
# Step 2: run slang codegen.
# Step 3: format.
#
# Run this after pulling translation updates from Weblate, or when you add a
# new string in an *.i18next.json file locally.

set -euo pipefail

cd "$(dirname "$0")/.."

dart run tool/i18next_to_slang.dart
dart run slang
dart format lib/i18n/generated
