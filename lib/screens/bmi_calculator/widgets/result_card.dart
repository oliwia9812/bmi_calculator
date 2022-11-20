import 'package:bmi_calculator/screens/bmi_calculator/widgets/custom_linear_gauge.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({super.key});

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
        child: Container(
          decoration: AppDecorations.card(),
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CardLabel(labelText: "Your BMI result"),
              Column(
                children: [
                  _buildBMIResult(),
                  _buildResultInterpretation(),
                ],
              ),
              _buildLinearGauge(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBMIResult() {
    return const Text(
      '-',
      style: AppTextStyles.cardTitleLarge,
    );
  }

  Widget _buildResultInterpretation() {
    return const Text(
      "",
      style: AppTextStyles.cardTitleSmall,
    );
  }

  Widget _buildLinearGauge() {
    return const CustomLinearGauge();
  }
}
