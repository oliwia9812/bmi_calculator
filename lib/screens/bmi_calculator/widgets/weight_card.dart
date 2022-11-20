import 'package:bmi_calculator/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/custom_text_form_field.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<String> _weightValues = ["kg", "st+lb"];

class WeightCard extends StatefulWidget {
  const WeightCard({super.key});

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  String _dropdownValue = _weightValues.first;
  bool _isImperial = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 32.0),
          height: 160.0,
          decoration: AppDecorations.card(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: AppColors.darkGray,
                  value: _dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      _dropdownValue = value!;
                    });

                    if (value == "st+lb") {
                      _isImperial = true;
                    } else {
                      _isImperial = false;
                    }
                  },
                  items: _weightValues
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: CardLabel(
                            labelText: "Weight ($value)",
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Row(
                children: [
                  if (_isImperial) ...[
                    _buildTextFormField(
                      hintText: "st",
                      onChange: (value) {},
                    ),
                    _buildTextFormField(
                      hintText: "lb",
                      onChange: (value) {},
                    ),
                  ] else ...[
                    _buildTextFormField(
                      hintText: "60",
                      onChange: (value) {
                        if (value.isEmpty || value.length < 2) {
                          context.read<CalculatorBloc>().add(
                                const ResetInput(inputType: InputType.weight),
                              );
                        } else {
                          context.read<CalculatorBloc>().add(
                                GetBmiResult(weight: double.parse(value)),
                              );
                        }
                      },
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String hintText,
    required void Function(String)? onChange,
  }) {
    return CustomTextFormField(
      hintText: hintText,
      onChange: onChange,
    );
  }
}
