import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearGauge extends StatefulWidget {
  final double? pointerValue;
  const CustomLinearGauge({this.pointerValue, super.key});

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
      markerPointers: [
        LinearShapePointer(
          value: widget.pointerValue ?? 0,
          color: AppColors.darkGray,
        ),
      ],
      ranges: const [
        LinearGaugeRange(
          startValue: 12.0,
          endValue: 16.0,
          color: AppColors.mint,
        ),
        LinearGaugeRange(
          startValue: 16.0,
          endValue: 16.9,
          color: AppColors.darkMint,
        ),
        LinearGaugeRange(
          startValue: 16.9,
          endValue: 18.5,
          color: AppColors.darkBlue,
        ),
        LinearGaugeRange(
          startValue: 18.5,
          endValue: 24.9,
          color: AppColors.green,
        ),
        LinearGaugeRange(
          startValue: 24.9,
          endValue: 29.9,
          color: AppColors.yellow,
        ),
        LinearGaugeRange(
          startValue: 29.9,
          endValue: 34.9,
          color: AppColors.orange,
        ),
        LinearGaugeRange(
          startValue: 34.9,
          endValue: 39.9,
          color: AppColors.pink,
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
