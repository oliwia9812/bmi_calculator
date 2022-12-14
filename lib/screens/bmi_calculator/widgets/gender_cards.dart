import 'package:bmi_calculator/bloc/bmi_calculator/calculator_bloc.dart';
import 'package:bmi_calculator/generated/assets.gen.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/gender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCards extends StatefulWidget {
  const GenderCards({super.key});

  @override
  State<GenderCards> createState() => _GenderCardsState();
}

class _GenderCardsState extends State<GenderCards> {
  late List<bool> _selections = [];

  @override
  void initState() {
    _selections = [false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state is CalculatorInitial) {
          setState(() {
            _selections = [false, false];
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: LayoutBuilder(
          builder: (context, constraints) => ToggleButtons(
            constraints:
                BoxConstraints.expand(width: (constraints.maxWidth) / 2),
            fillColor: Colors.transparent,
            isSelected: _selections,
            renderBorder: false,
            splashColor: Colors.transparent,
            children: [
              GenderButton(
                genderTitle: "Male",
                genderImage: Assets.images.genderMale.path,
                isSelected: _selections[0],
              ),
              GenderButton(
                genderTitle: "Female",
                genderImage: Assets.images.genderFemale.path,
                isSelected: _selections[1],
              ),
            ],
            onPressed: (index) {
              setState(() {
                for (int i = 0; i < _selections.length; i++) {
                  _selections[i] = i == index;
                }
                if (index == 0) {
                  context
                      .read<CalculatorBloc>()
                      .add(const SetGenderEvent(gender: Gender.male));
                } else {
                  context
                      .read<CalculatorBloc>()
                      .add(const SetGenderEvent(gender: Gender.female));
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
