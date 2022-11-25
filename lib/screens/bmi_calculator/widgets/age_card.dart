import 'package:bmi_calculator/bloc/bmi_calculator/calculator_bloc.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeCard extends StatefulWidget {
  const AgeCard({super.key});

  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  int _currentAge = Constants.initialAge;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state is AgeChanged) {
          setState(() {
            _currentAge = state.age;
          });
        }
      },
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
            children: [
              const CardLabel(labelText: 'Age'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIconButton(
                      icon: Icons.remove,
                      callback: () {
                        context
                            .read<CalculatorBloc>()
                            .add(const UpdateAgeEvent(isIncrement: false));
                      },
                    ),
                    _buildAge(),
                    _buildIconButton(
                      icon: Icons.add,
                      callback: () {
                        context
                            .read<CalculatorBloc>()
                            .add(const UpdateAgeEvent(isIncrement: true));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback callback,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: const CircleBorder(),
      ),
      onPressed: callback,
      child: Icon(icon),
    );
  }

  Widget _buildAge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Text(
        _currentAge.toString(),
        style: AppTextStyles.cardTitleMedium,
      ),
    );
  }
}
