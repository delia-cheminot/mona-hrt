import 'package:clock/clock.dart';
import 'package:fake_async/fake_async.dart';

/// A fixed instant shared across tests so that any code reading the clock
/// (`clock.now()`, and therefore `Date.today()`, the notification scheduler,
/// etc.) behaves identically regardless of the wall-clock time at which the
/// suite runs.
///
/// It is local noon, deliberately well clear of the day boundaries that make
/// date logic flaky (midnight and the 4am "logical day" rule in [Date]).
final DateTime testNow = DateTime(2026, 6, 1, 12, 0);

/// Runs synchronous [body] with the clock frozen at [at] (defaults to
/// [testNow]). Inside, `clock.now()` returns [at].
///
/// Backed by [fakeAsync], so a test that needs to advance time can use the
/// [fakeAsync] form directly and call `async.elapse(...)` instead.
T withFixedClock<T>(T Function() body, {DateTime? at}) =>
    fakeAsync((_) => body(), initialTime: at ?? testNow);

/// Runs asynchronous [body] with the clock frozen at [at] (defaults to
/// [testNow]), awaiting real futures normally.
///
/// Use this instead of [withFixedClock] when the test `await`s genuine
/// asynchronous work (e.g. mocked plugin calls): [withClock] only swaps the
/// clock and leaves the event loop untouched, whereas [fakeAsync] would also
/// fake timers and require manual flushing of microtasks.
Future<T> withFixedClockAsync<T>(
  Future<T> Function() body, {
  DateTime? at,
}) =>
    withClock(Clock.fixed(at ?? testNow), body);
