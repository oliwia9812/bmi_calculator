import 'package:bmi_calculator/bloc/bmi_calculator/calculator_bloc.dart';
import 'package:bmi_calculator/repositories/units_repository.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/age_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/gender_cards.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/height_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/result_card.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/units_picker.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/weight_card.dart';
import 'package:bmi_calculator/screens/bmi_result/bmi_result_screen.dart';
import 'package:bmi_calculator/shared/screen_title.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  late bool _saveResultButtonIsEnable;

  @override
  void initState() {
    super.initState();
    context
        .read<CalculatorBloc>()
        .add(const SwitchCurrentUnit(currentUnit: CurrentUnit.metric));
    _saveResultButtonIsEnable =
        context.read<CalculatorBloc>().saveBmiResultButtonIsEnable;
  }

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
        child: Column(
          children: [
            _buildHeader(context),
            _buildSelectGender(),
            _buildSelectAge(),
            _buildSelectWeightAndHeight(),
            _buildResult(),
            _buildSaveBmiResultButton(context),
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
            _buildResultScreenButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const ScreenTitle(title: "BMI Calculator");
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

  Widget _buildResultScreenButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.list),
      iconSize: 30.0,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BmiResultScreen(),
            ));
        context.read<CalculatorBloc>().add(ResetEvent());
      },
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      iconSize: 28.0,
      onPressed: () {
        context.read<CalculatorBloc>().add(ResetEvent());
        context
            .read<CalculatorBloc>()
            .add(const SwitchCurrentUnit(currentUnit: CurrentUnit.metric));
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

  Widget _buildSaveBmiResultButton(BuildContext context) {
    return BlocListener<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state is CalculatorLoaded) {
          setState(() {
            _saveResultButtonIsEnable =
                context.read<CalculatorBloc>().saveBmiResultButtonIsEnable;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: ElevatedButton(
          style: AppDecorations.elevatedButton,
          onPressed: _saveResultButtonIsEnable
              ? () {
                  context.read<CalculatorBloc>().add(SaveBmiResultEvent());

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BmiResultScreen(),
                      ));
                }
              : null,
          child: const Text(
            'Save BMI result',
            style: AppTextStyles.elevatedButton,
          ),
        ),
      ),
    );
  }
}
