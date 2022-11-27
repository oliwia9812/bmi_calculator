import 'package:bmi_calculator/bloc/bmi_calculator/calculator_bloc.dart';
import 'package:bmi_calculator/repositories/units_repository.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/custom_text_form_field.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightCard extends StatefulWidget {
  const WeightCard({super.key});

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  final TextEditingController _weightKgController = TextEditingController();
  final TextEditingController _weightLbController = TextEditingController();
  final FocusNode _fWeightLb = FocusNode();
  final FocusNode _fWeightKg = FocusNode();

  @override
  void dispose() {
    _fWeightKg.dispose();
    _fWeightLb.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state is CalculatorInitial) {
          _fWeightKg.unfocus();
          _fWeightLb.unfocus();
          _weightKgController.clear();
          _weightLbController.clear();
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.weight));

          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.lbs));
        }
      },
      builder: (context, state) {
        if (state is CalculatorLoaded) {
          String unit = state.currentUnit == CurrentUnit.metric ? "kg" : "lb";

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                height: 160.0,
                decoration: AppDecorations.card(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCardLabel(unit),
                    Row(
                      children: [
                        if (state.currentUnit == CurrentUnit.metric) ...[
                          _buildWeightKg(),
                        ] else if (state.currentUnit ==
                            CurrentUnit.imperial) ...[
                          _buildWeightLb(),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCardLabel(String unit) {
    return CardLabel(labelText: "Weight ($unit)");
  }

  Widget _buildTextFormField({
    required String hintText,
    required void Function(String)? onChange,
    FocusNode? focusNode,
    TextEditingController? controller,
  }) {
    return CustomTextFormField(
      hintText: hintText,
      onChange: onChange,
      controller: controller,
      focusNode: focusNode,
    );
  }

  Widget _buildWeightLb() {
    return _buildTextFormField(
      hintText: "lb",
      controller: _weightLbController,
      focusNode: _fWeightLb,
      onChange: (value) {
        if (value.isEmpty || value.length < 2) {
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.lbs));
        } else {
          context
              .read<CalculatorBloc>()
              .add(UpdateImperialEvent(lbs: int.parse(value)));
        }
      },
    );
  }

  Widget _buildWeightKg() {
    return _buildTextFormField(
      hintText: "60",
      controller: _weightKgController,
      focusNode: _fWeightKg,
      onChange: (value) {
        if (value.isEmpty || value.length < 2) {
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.weight));
        } else {
          context
              .read<CalculatorBloc>()
              .add(UpdateMetricEvent(weight: int.parse(value)));
        }
      },
    );
  }
}
