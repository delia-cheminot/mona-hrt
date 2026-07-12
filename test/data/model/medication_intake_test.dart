import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import '../../fixtures.dart';

void main() {
  setUpAll(() {
    tz.initializeTimeZones();
  });
  group('MedicationIntake', () {
    test('constructor should throw if takenDateTime is not UTC', () {
      expect(
        () => MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime(2025, 9, 14, 12, 0),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        ),
        throwsArgumentError,
      );
    });

    test(
        'constructor should throw if takenDateTime is provided without takenTimeZone',
        () {
      expect(
        () => MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2025, 9, 14, 12, 0),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        ),
        throwsArgumentError,
      );
    });

    test('toMap and fromMap should preserve values', () {
      // Arrange
      final intake = aMedicationIntake(
        id: 1,
        time: const TimeOfDay(hour: 8, minute: 30),
        dose: Decimal.parse('2.5'),
        wastedAmount: Decimal.parse('0.1'),
        scheduleId: 42,
        administrationRoute: AdministrationRoute.injection,
        ester: Ester.cypionate,
        placements: [
          aPlacement(),
          aCustomPlacement(),
        ],
      );

      // Act
      final map = intake.toMap();
      final fromMap =
          MedicationIntakeMapper.fromMap(Map<String, dynamic>.from(map));

      expect(
        fromMap,
        isA<MedicationIntake>()
            .having((i) => i.id, 'id', intake.id)
            .having(
                (i) => i.takenDateTime, 'takenDateTime', intake.takenDateTime)
            .having(
                (i) => i.takenTimeZone, 'takenTimeZone', intake.takenTimeZone)
            .having((i) => i.takenDose, 'dose', intake.takenDose)
            .having((i) => i.wastedAmount, 'wastedAmount', intake.wastedAmount)
            .having((i) => i.scheduleId, 'scheduleId', intake.scheduleId)
            .having((i) => i.molecule, 'molecule', intake.molecule)
            .having((i) => i.administrationRoute, 'administrationRoute',
                intake.administrationRoute)
            .having((i) => i.ester, 'ester', intake.ester)
            .having(
                (i) => i.scheduledTime, 'scheduledTime', intake.scheduledTime)
            .having((i) => i.placements, 'placements', intake.placements),
      );
    });

    test('isTaken returns correct value', () {
      final intakeTaken = MedicationIntake(
        takenDose: Decimal.one,
        takenDateTime: DateTime.utc(2025, 9, 14, 11, 0),
        takenTimeZone: 'Etc/UTC',
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      );

      final intakeNotTaken = MedicationIntake(
        takenDose: Decimal.one,
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      );

      expect(
        [
          intakeTaken.isTaken,
          intakeNotTaken.isTaken,
        ],
        [
          true,
          false,
        ],
      );
    });

    group('takenLocalDateTime and takenLocalDate', () {
      test('takenLocalDateTime returns null when takenDateTime is null', () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: null,
          takenTimeZone: 'Europe/Paris',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final result = intake.takenLocalDateTime;

        // Assert
        expect(result, isNull);
      });

      test(
          'takenLocalDateTime converts UTC to Europe/Paris summer time (UTC+2)',
          () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2024, 6, 15, 8, 0),
          takenTimeZone: 'Europe/Paris',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final takenLocalDateTime = intake.takenLocalDateTime;

        // Assert
        expect(takenLocalDateTime?.hour, 10);
      });

      test(
          'takenLocalDateTime works with timezone names not in the reduced database',
          () {
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2024, 6, 15, 10, 0),
          takenTimeZone:
              'Europe/Amsterdam', // missing from package:timezone latest.dart
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        expect(intake.takenLocalDate, Date(year: 2024, month: 6, day: 15));
      });

      test(
          'takenLocalDateTime handles day rollback when crossing midnight behind UTC',
          () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2024, 6, 15, 1, 0),
          takenTimeZone: 'America/New_York',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final result = intake.takenLocalDateTime;

        // Assert
        expect(result?.day, 14);
      });

      test('takenLocalDate returns null when takenDateTime is null', () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: null,
          takenTimeZone: 'Europe/Paris',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final result = intake.takenLocalDate;

        // Assert
        expect(result, isNull);
      });

      test('takenLocalDate returns correct date in Europe/Paris timezone', () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2024, 6, 15, 10, 0),
          takenTimeZone: 'Europe/Paris',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final result = intake.takenLocalDate;

        // Assert
        expect(result, Date(year: 2024, month: 6, day: 15));
      });

      test(
          'takenLocalDate returns previous calendar date when local time crosses midnight behind UTC',
          () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2024, 6, 15, 1, 0),
          takenTimeZone: 'America/New_York',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final result = intake.takenLocalDate;

        // Assert
        expect(result, Date(year: 2024, month: 6, day: 14));
      });

      test(
          'takenLocalDate returns previous date if taken is before 4am local time',
          () {
        // Arrange
        final intake = MedicationIntake(
          takenDose: Decimal.one,
          takenDateTime: DateTime.utc(2024, 6, 15, 2, 0),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        // Act
        final result = intake.takenLocalDate;

        // Assert
        expect(result, Date(year: 2024, month: 6, day: 14));
      });
    });
  });
}
