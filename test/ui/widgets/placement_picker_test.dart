import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/ui/widgets/placement_picker.dart';

void main() {
  const options = [CustomPlacement('thigh'), CustomPlacement('tummy')];

  testWidgets('tapping an unselected chip adds it to the selection',
      (tester) async {
    // Arrange
    List<Placement>? result;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PlacementPicker(
          options: options,
          selected: const [],
          onChanged: (v) => result = v,
        ),
      ),
    ));

    // Act
    await tester.tap(find.text('tummy'));
    await tester.pump();

    // Assert
    expect(result, const [CustomPlacement('tummy')]);
  });

  testWidgets('tapping a selected chip removes it from the selection',
      (tester) async {
    // Arrange
    List<Placement>? result;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PlacementPicker(
          options: options,
          selected: const [CustomPlacement('thigh')],
          onChanged: (v) => result = v,
        ),
      ),
    ));

    // Act
    await tester.tap(find.text('thigh'));
    await tester.pump();

    // Assert
    expect(result, const []);
  });
}
