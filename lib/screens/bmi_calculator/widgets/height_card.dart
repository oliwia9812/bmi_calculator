import 'package:bmi_calculator/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/repository/units_repository.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/custom_text_form_field.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({super.key});

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  final TextEditingController _heightFtController = TextEditingController();
  final TextEditingController _heightInController = TextEditingController();
  final TextEditingController _heightCmController = TextEditingController();
  final FocusNode _fHeightFt = FocusNode();
  final FocusNode _fHeightIn = FocusNode();
  final FocusNode _fHeightCm = FocusNode();

  @override
  void dispose() {
    _fHeightFt.dispose();
    _fHeightIn.dispose();
    _fHeightCm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorBloc, CalculatorState>(
      listener: (context, state) {
        if (state is CalculatorInitial) {
          _heightFtController.clear();
          _heightInController.clear();
          _heightCmController.clear();
          _fHeightFt.unfocus();
          _fHeightIn.unfocus();
          _fHeightCm.unfocus();

          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.height));

          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.feet));
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.inches));
        }
      },
      builder: (context, state) {
        if (state is CalculatorLoaded) {
          String unit =
              state.currentUnit == CurrentUnit.metric ? "cm" : "ft/in";
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
                          _buildHeightCm(),
                        ] else ...[
                          _buildHeightFt(),
                          _buildHeightIn(),
                        ]
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
    return CardLabel(labelText: "Height ($unit)");
  }

  Widget _buildTextFormField({
    required String hintText,
    required void Function(String)? onChange,
    required int limitingNumber,
    FocusNode? focusNode,
    TextEditingController? controller,
  }) {
    return CustomTextFormField(
      hintText: hintText,
      onChange: onChange,
      controller: controller,
      focusNode: focusNode,
      limitingNumber: limitingNumber,
    );
  }

  Widget _buildHeightFt() {
    return _buildTextFormField(
      limitingNumber: 1,
      hintText: "ft",
      focusNode: _fHeightFt,
      controller: _heightFtController,
      onChange: (value) {
        if (value.isEmpty) {
          _fHeightFt.unfocus();
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.feet));
        } else if (value.length == 1) {
          FocusScope.of(context).requestFocus(_fHeightIn);
          context
              .read<CalculatorBloc>()
              .add(UpdateImperialEvent(feet: int.parse(value)));
        }
      },
    );
  }

  Widget _buildHeightIn() {
    return _buildTextFormField(
      limitingNumber: 2,
      hintText: "in",
      controller: _heightInController,
      onChange: (value) {
        if (value.isEmpty) {
          FocusScope.of(context).requestFocus(_fHeightFt);
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.inches));
        } else {
          context
              .read<CalculatorBloc>()
              .add(UpdateImperialEvent(inches: double.parse(value)));
        }
      },
      focusNode: _fHeightIn,
    );
  }

  Widget _buildHeightCm() {
    return _buildTextFormField(
      limitingNumber: 3,
      hintText: "175",
      controller: _heightCmController,
      focusNode: _fHeightCm,
      onChange: (value) {
        if (value.isEmpty) _fHeightCm.unfocus();
        if (value.isEmpty || value.length <= 2) {
          context
              .read<CalculatorBloc>()
              .add(const ResetInputEvent(inputType: InputType.height));
        } else {
          context
              .read<CalculatorBloc>()
              .add(UpdateMetricEvent(height: int.parse(value)));
        }
      },
    );
  }
}
