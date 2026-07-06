import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/chart/chart_graph.dart';
import 'package:mona/ui/views/chart/chart_slider.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatefulWidget {
  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicationIntakeProvider>(
        builder: (context, medicationIntakeProvider, child) {
      return MainPageWrapper(
        isLoading: medicationIntakeProvider.isLoading,
        isEmpty: medicationIntakeProvider.graphIntakes.isEmpty,
        emptyMessage: t.empty_levels,
        child: Column(
          children: [
            ChartSlider(
              value: sliderValue,
              onChanged: (v) => setState(() => sliderValue = v),
            ),
            Expanded(child: MainGraph(window: sliderValue)),
          ],
        ),
      );
    });
  }
}
