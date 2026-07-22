import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/intakes/intake_counter_card.dart';
import 'package:mona/util/hrt_duration.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('shows the duration when enabled', (tester) async {
    // Arrange
    await tester.pumpWidget(wrap(const IntakeCounterCard(
      enabled: true,
      duration: HrtDuration(HrtDurationUnit.weeks, 14),
      intakeCount: 142,
    )));

    // Act
    final found = find.text(t.onHrtForWeeks(count: 14));

    // Assert
    expect(found, findsOneWidget);
  });

  testWidgets('shows the intake count subtitle when enabled', (tester) async {
    // Arrange
    await tester.pumpWidget(wrap(const IntakeCounterCard(
      enabled: true,
      duration: HrtDuration(HrtDurationUnit.weeks, 14),
      intakeCount: 142,
    )));

    // Act
    final found = find.text(t.intakesLoggedCount(count: 142));

    // Assert
    expect(found, findsOneWidget);
  });

  testWidgets('renders nothing when disabled', (tester) async {
    // Arrange
    await tester.pumpWidget(wrap(const IntakeCounterCard(
      enabled: false,
      duration: HrtDuration(HrtDurationUnit.weeks, 14),
      intakeCount: 142,
    )));

    // Act
    final found = find.byType(ListTile);

    // Assert
    expect(found, findsNothing);
  });

  testWidgets('renders nothing when there is no duration', (tester) async {
    // Arrange
    await tester.pumpWidget(wrap(const IntakeCounterCard(
      enabled: true,
      duration: null,
      intakeCount: 0,
    )));

    // Act
    final found = find.byType(ListTile);

    // Assert
    expect(found, findsNothing);
  });
}
