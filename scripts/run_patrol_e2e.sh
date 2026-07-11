#!/bin/bash
# Runs the Patrol Android E2E suite with retries.
#
# PATROL_TARGET (optional): a single integration_test/*_test.dart file to run.
# The CI matrix sets this so each shard runs one file; when unset, Patrol runs
# every test under the configured test_directory.

set -u

ATTEMPTS="${PATROL_ATTEMPTS:-3}"
ATTEMPT_TIMEOUT="${PATROL_ATTEMPT_TIMEOUT:-600}"

# Build the optional --target flag as an array so an unset target expands to
# nothing rather than an empty argument that Patrol would try to parse.
target_args=()
if [ -n "${PATROL_TARGET:-}" ]; then
  target_args=(--target "$PATROL_TARGET")
  echo "Targeting single test file: $PATROL_TARGET"
fi

# A crashed/wedged attempt can leave adb (and orphaned Gradle/instrumentation
# processes) stuck; reset them so the next attempt starts from a clean device.
reset_device_state() {
  ./android/gradlew --stop >/dev/null 2>&1 || true
  adb kill-server >/dev/null 2>&1 || true
  adb start-server >/dev/null 2>&1 || true
  adb wait-for-device >/dev/null 2>&1 || true
}

for attempt in $(seq 1 "$ATTEMPTS"); do
  echo "::group::Patrol attempt $attempt/$ATTEMPTS"
  # Capture the exit code directly: `if timeout ...; then` would mask it, because
  # an `if` whose condition is false and which has no `else` is itself status 0.
  # --kill-after escalates to SIGKILL if patrol_cli ignores the initial SIGTERM.
  timeout --kill-after=30s "$ATTEMPT_TIMEOUT" \
    dart run patrol_cli:main test --flavor standalone ${target_args[@]+"${target_args[@]}"}
  status=$?
  echo "::endgroup::"

  if [ "$status" -eq 0 ]; then
    exit 0
  elif [ "$status" -eq 124 ]; then
    echo "Patrol attempt $attempt/$ATTEMPTS wedged and was killed after ${ATTEMPT_TIMEOUT}s; retrying..."
  else
    echo "Patrol attempt $attempt/$ATTEMPTS failed (exit $status, likely an instrumentation-process crash); retrying..."
  fi
  reset_device_state
done

echo "Patrol failed after $ATTEMPTS attempts."
exit 1
