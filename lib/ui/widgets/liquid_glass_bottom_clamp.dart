import 'package:flutter/material.dart';
import 'package:mona/distribution.dart';

class LiquidGlassBottomClamp extends StatelessWidget {
  final Widget child;
  final double bottom;
  final bool? enabled;

  const LiquidGlassBottomClamp({
    super.key,
    required this.child,
    this.bottom = 0,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    if (!(enabled ?? isIosLiquidGlass)) return child;

    final mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(
        padding: mediaQuery.padding.copyWith(bottom: bottom),
      ),
      child: child,
    );
  }
}
