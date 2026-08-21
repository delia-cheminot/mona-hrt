import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/hrt_duration.dart';

class HrtCounterCard extends StatelessWidget {
  final bool enabled;
  final HrtDuration? duration;
  final int intakeCount;

  const HrtCounterCard({
    super.key,
    required this.enabled,
    required this.duration,
    required this.intakeCount,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled || duration == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    return M3ECardColumn(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(vertical: 8),
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.tertiaryContainer,
            child: Icon(
              Symbols.calendar_month_rounded,
              color: theme.colorScheme.onTertiaryContainer,
            ),
          ),
          title: Text(hrtDurationText(duration!),
              style: theme.textTheme.titleMedium),
          subtitle: Text(t.intakesLoggedCount(count: intakeCount)),
        ),
      ],
    );
  }
}
