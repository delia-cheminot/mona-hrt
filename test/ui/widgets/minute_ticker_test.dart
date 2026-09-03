import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/ui/widgets/minute_ticker.dart';

class _TickerHost extends StatefulWidget {
  const _TickerHost({required this.onBuild});

  final VoidCallback onBuild;

  @override
  State<_TickerHost> createState() => _TickerHostState();
}

class _TickerHostState extends State<_TickerHost> with MinuteTicker {
  @override
  Widget build(BuildContext context) {
    widget.onBuild();
    return const SizedBox.shrink();
  }
}

void main() {
  testWidgets('rebuilds after a minute passes', (tester) async {
    // Arrange
    var builds = 0;
    await tester.pumpWidget(_TickerHost(onBuild: () => builds++));
    final initial = builds;

    // Act
    await tester.pump(const Duration(minutes: 1));

    // Assert
    expect(builds, initial + 1);
  });
}
