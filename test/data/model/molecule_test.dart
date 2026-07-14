import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/molecule.dart';

void main() {
  group('Molecule', () {
    test('normalizedName trims spaces and lowercases', () {
      // Arrannge
      final molecule = Molecule(name: '  TestMol  ', unit: 'mg');

      // Act
      final normalizedName = molecule.normalizedName;

      // Assert
      expect(normalizedName, 'testmol');
    });

    group('Molecule equality', () {
      test('two identical molecules are equal', () {
        // Arrange
        final m1 = Molecule(name: 'A', unit: 'mg');
        final m2 = Molecule(name: 'A', unit: 'mg');

        // Act
        final equals = m1 == m2;

        // Assert
        expect(equals, true);
      });

      test('different molecules are not equal', () {
        // Arrange
        final m1 = Molecule(name: 'A', unit: 'mg');
        final m3 = Molecule(name: 'B', unit: 'mg');

        // Act
        final equals = m1 == m3;

        // Assert
        expect(equals, false);
      });

      test('hashCode is equal for identical molecules', () {
        // Arrange
        final m1 = Molecule(name: 'A', unit: 'mg');
        final m2 = Molecule(name: 'A', unit: 'mg');

        // Act
        final hash1 = m1.hashCode;
        final hash2 = m2.hashCode;

        // Assert
        expect(hash1, hash2);
      });

      test('hashCode is different for different molecules', () {
        // Arrange
        final m1 = Molecule(name: 'A', unit: 'mg');
        final m3 = Molecule(name: 'B', unit: 'mg');

        // Act
        final hashEquals = m1.hashCode == m3.hashCode;

        // Assert
        expect(hashEquals, false);
      });
    });
  });
}
