import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/l10n/app_localizations.dart';
import 'package:mona/ui/widgets/forms/form_date_field.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en');
  });

  testWidgets('picking a day returns that exact day (no off-by-one)',
      (WidgetTester tester) async {
    // Arrange
    final initial = Date(year: 2026, month: 6, day: 15);
    Date? result;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: FormDateField(
            date: initial,
            label: 'Start date',
            onChanged: (date) => result = date,
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    await tester.tap(find.text('20'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Assert
    expect(result, isNotNull);
    expect(result, Date(year: 2026, month: 6, day: 20));
  });
}
