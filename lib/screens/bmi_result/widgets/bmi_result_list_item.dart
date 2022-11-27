import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiResultListItem extends StatelessWidget {
  final BmiResult? bmiResult;
  const BmiResultListItem({required this.bmiResult, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: AppDecorations.card(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDate(),
          _buildBmiResult(),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildDate() {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.cardTitleSmall(),
        children: [
          const TextSpan(text: "Date: "),
          TextSpan(
            text: DateFormat.yMMMd().format(bmiResult!.date!).toString(),
            style: AppTextStyles.cardBody,
          ),
        ],
      ),
    );
  }

  Widget _buildBmiResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: .4,
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: _getColor(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            bmiResult?.bmiResult.toString() ?? "-",
            style: AppTextStyles.cardTitleMedium,
          ),
        ),
        Text(
          bmiResult?.interpretation ?? "-",
          style: AppTextStyles.cardTitleSmall(color: _getColor()),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.cardTitleSmall(),
        children: [
          const TextSpan(text: "W: "),
          TextSpan(
            text: "${bmiResult!.weight} ${_getWeightUnit()}",
            style: AppTextStyles.cardBody,
          ),
          const TextSpan(text: " | "),
          const TextSpan(text: "H: "),
          TextSpan(
            text: "${_getHeight()} ${_getHeightUnit()} ",
            style: AppTextStyles.cardBody,
          ),
        ],
      ),
    );
  }

  num _getHeight() {
    if (bmiResult!.currentUnit == "Metric") {
      return bmiResult!.height!.round();
    } else {
      return bmiResult!.height!;
    }
  }

  String _getWeightUnit() {
    if (bmiResult!.currentUnit == "Metric") {
      return "kg";
    } else {
      return "lb";
    }
  }

  String _getHeightUnit() {
    if (bmiResult!.currentUnit == "Metric") {
      return "cm";
    } else {
      return "ft";
    }
  }

  Color _getColor() {
    double result = bmiResult!.bmiResult!;
    if (result < 16.0) {
      return AppColors.mint;
    } else if (result >= 16.0 && result < 16.9) {
      return AppColors.darkMint;
    } else if (result >= 16.9 && result < 18.5) {
      return AppColors.darkBlue;
    } else if (result >= 18.5 && result < 24.9) {
      return AppColors.green;
    } else if (result >= 24.9 && result < 29.9) {
      return AppColors.yellow;
    } else if (result >= 29.9 && result < 34.9) {
      return AppColors.orange;
    } else if (result >= 34.9 && result < 39.9) {
      return AppColors.pink;
    } else if (result >= 39.0) {
      return AppColors.red;
    }

    return AppColors.black;
  }
}
