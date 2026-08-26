import 'package:flutter/material.dart';

class ChartSlider extends StatefulWidget {
  final double value;
  final Function(double) onChanged;
  const ChartSlider({required this.value, required this.onChanged});

  @override
  State<ChartSlider> createState() => _ChartSliderState();
}

class _ChartSliderState extends State<ChartSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      min: 0,
      divisions: 20,
      onChanged: (double value) {
        setState(() => _currentSliderValue = value);
        widget.onChanged(value);
      },
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
