import 'package:bmi_calculator/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/custom_linear_gauge.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          height: 260.0,
          child: BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
              if (state is CalculatorLoaded) {
                final String? result = state.result;
                final String? interpretation = state.interpretation;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CardLabel(labelText: "Your BMI result"),
                    Column(
                      children: [
                        _buildBMIResult(result),
                        _buildResultInterpretation(interpretation),
                      ],
                    ),
                    _buildLinearGauge(result),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBMIResult(String? result) {
    return Text(
      result ?? "-",
      style: AppTextStyles.cardTitleLarge,
    );
  }

  Widget _buildResultInterpretation(String? interpretation) {
    return Text(
      interpretation ?? "",
      style: AppTextStyles.cardTitleSmall,
    );
  }

  Widget _buildLinearGauge(String? result) {
    return CustomLinearGauge(
      pointerValue: result != null ? double.parse(result) : 0.0,
    );
  }
}
