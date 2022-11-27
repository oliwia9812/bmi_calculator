import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardLabel extends StatelessWidget {
  final String labelText;
  const CardLabel({required this.labelText, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: AppTextStyles.cardTitleSmall(),
    );
  }
}
