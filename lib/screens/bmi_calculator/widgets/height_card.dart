import 'package:bmi_calculator/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/custom_text_form_field.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<String> _heightValues = ["cm", "ft+in"];

class HeightCard extends StatefulWidget {
  const HeightCard({super.key});

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  String _dropdownValue = _heightValues.first;
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

                    if (value == "ft+in") {
                      _isImperial = true;
                    } else {
                      _isImperial = false;
                    }
                  },
                  items: _heightValues
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: CardLabel(
                            labelText: "Height ($value)",
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
                      hintText: "ft",
                      onChange: (value) {},
                    ),
                    _buildTextFormField(
                      hintText: "in",
                      onChange: (value) {},
                    ),
                  ] else ...[
                    _buildTextFormField(
                      hintText: "175",
                      onChange: (value) {
                        if (value.isEmpty || value.length <= 2) {
                          context.read<CalculatorBloc>().add(
                              const ResetInput(inputType: InputType.height));
                        } else {
                          context
                              .read<CalculatorBloc>()
                              .add(GetBmiResult(height: double.parse(value)));
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
