import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: AppTextStyles.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
