import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class BmiResultListItem extends StatelessWidget {
  const BmiResultListItem({super.key});

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
      text: const TextSpan(
        style: AppTextStyles.cardTitleSmall,
        children: [
          TextSpan(text: "Date: "),
          TextSpan(
            text: "19 Nov, 2022",
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
              color: AppColors.black,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "22.4",
            style: AppTextStyles.cardTitleMedium,
          ),
        ),
        const Text(
          "NORMAL",
          style: AppTextStyles.cardTitleSmall,
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return RichText(
      text: const TextSpan(
        style: AppTextStyles.cardTitleSmall,
        children: [
          TextSpan(text: "H: "),
          TextSpan(
            text: "177 cm",
            style: AppTextStyles.cardBody,
          ),
          TextSpan(text: " | "),
          TextSpan(text: "W: "),
          TextSpan(
            text: "65 kg",
            style: AppTextStyles.cardBody,
          ),
        ],
      ),
    );
  }
}
