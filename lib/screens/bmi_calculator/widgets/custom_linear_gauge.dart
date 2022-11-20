import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearGauge extends StatefulWidget {
  const CustomLinearGauge({super.key});

  @override
  State<CustomLinearGauge> createState() => _CustomLinearGaugeState();
}

class _CustomLinearGaugeState extends State<CustomLinearGauge> {
  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: 12.0,
      maximum: 43.0,
      showTicks: false,
      showLabels: false,
      showAxisTrack: false,
      markerPointers: const [
        LinearShapePointer(
          value: 0,
          color: AppColors.darkGray,
        ),
      ],
      ranges: const [
        LinearGaugeRange(
          startValue: 12.0,
          endValue: 16.0,
          color: Color(0xFFB5D7D1),
        ),
        LinearGaugeRange(
          startValue: 16.0,
          endValue: 16.9,
          color: Color(0xFF80A49E),
        ),
        LinearGaugeRange(
          startValue: 16.9,
          endValue: 18.5,
          color: Color(0xFF7B8FC4),
        ),
        LinearGaugeRange(
          startValue: 18.5,
          endValue: 24.9,
          color: Color(0xFFB0E06B),
        ),
        LinearGaugeRange(
          startValue: 24.9,
          endValue: 29.9,
          color: Color(0xFFFFD337),
        ),
        LinearGaugeRange(
          startValue: 29.9,
          endValue: 34.9,
          color: Color(0xFFE9904D),
        ),
        LinearGaugeRange(
          startValue: 34.9,
          endValue: 39.9,
          color: Color(0xFFE07F84),
        ),
        LinearGaugeRange(
          startValue: 39.0,
          endValue: 43.0,
          color: Color(0xFFCB4646),
        ),
      ],
    );
  }
}
