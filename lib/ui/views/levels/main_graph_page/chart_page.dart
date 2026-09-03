import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/levels/main_graph_page/chart_graph.dart';
import 'package:mona/ui/views/levels/main_graph_page/chart_slider.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:mona/ui/widgets/minute_ticker.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatefulWidget {
  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> with MinuteTicker {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.estradiolLevelsTitle)),
      body: Consumer<MedicationIntakeProvider>(
          builder: (context, medicationIntakeProvider, child) {
        return SafeArea(
          child: MainPageWrapper(
            isLoading: medicationIntakeProvider.isLoading,
            isEmpty: medicationIntakeProvider.plottableIntakes.isEmpty,
            emptyMessage: "",
            child: Column(
              children: [
                ChartSlider(
                  value: sliderValue,
                  onChanged: (v) => setState(() => sliderValue = v),
                ),
                Expanded(child: MainGraph(window: sliderValue)),
              ],
            ),
          ),
        );
      }),
    );
  }
}
