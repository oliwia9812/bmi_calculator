import 'package:bmi_calculator/screens/bmi_calculator/widgets/age_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/gender_cards.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/height_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/result_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/weight_card.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 64.0,
        ),
        child: Column(
          children: [
            _buildHeader(),
            _buildSelectGender(),
            _buildSelectAge(),
            _buildSelectWeightAndHeight(),
            _buildResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(),
        _buildResetButton(),
      ],
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "BMI Calculator",
        style: AppTextStyles.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildResetButton() {
    return IconButton(
      icon: const Icon(Icons.refresh),
      iconSize: 28.0,
      onPressed: () {},
    );
  }

  Widget _buildSelectGender() {
    return const GenderCards();
  }

  Widget _buildSelectAge() {
    return const AgeCard();
  }

  Widget _buildSelectWeightAndHeight() {
    return Row(
      children: const [
        WeightCard(),
        HeightCard(),
      ],
    );
  }

  Widget _buildResult() {
    return const ResultCard();
  }
}
