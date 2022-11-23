import 'package:bmi_calculator/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/age_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/gender_cards.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/height_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/result_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/units_picker.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/weight_card.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 32.0,
        ),
        // child: Column(
        //   children: [
        //     _buildHeader(context),
        //     _buildSelectGender(),
        //     _buildSelectAge(),
        //     _buildSelectWeightAndHeight(),
        //     _buildResult(),
        //   ],
        // ),
        child: ListView(
          children: [
            _buildHeader(context),
            _buildSelectGender(),
            _buildSelectAge(),
            _buildSelectWeightAndHeight(),
            _buildResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(),
        Row(
          children: [
            _buildSettingsButton(context),
            _buildResetButton(context),
          ],
        ),
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

  Widget _buildSettingsButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      iconSize: 28.0,
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => const UnitsPicker(),
        );
      },
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      iconSize: 28.0,
      onPressed: () {
        context.read<CalculatorBloc>().add(ResetEvent());
      },
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
