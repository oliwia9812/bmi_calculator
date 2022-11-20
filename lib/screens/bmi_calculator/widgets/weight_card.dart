import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/custom_text_form_field.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';

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
                    _buildTextFormField(hintText: "st"),
                    _buildTextFormField(hintText: "lb"),
                  ] else ...[
                    _buildTextFormField(hintText: "60"),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({required String hintText}) {
    return CustomTextFormField(hintText: hintText);
  }
}
