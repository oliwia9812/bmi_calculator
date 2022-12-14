import 'package:bmi_calculator/bloc/bmi_calculator/calculator_bloc.dart';
import 'package:bmi_calculator/repositories/units_repository.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitsPicker extends StatefulWidget {
  const UnitsPicker({super.key});

  @override
  State<UnitsPicker> createState() => _UnitsPickerState();
}

class _UnitsPickerState extends State<UnitsPicker> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    switch (_selectedValue) {
      case 0:
        context
            .read<CalculatorBloc>()
            .add(const SwitchCurrentUnit(currentUnit: CurrentUnit.metric));

        context.read<CalculatorBloc>().add(ResetEvent());
        break;
      case 1:
        context
            .read<CalculatorBloc>()
            .add(const SwitchCurrentUnit(currentUnit: CurrentUnit.imperial));

        context.read<CalculatorBloc>().add(ResetEvent());
        break;
      default:
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: double.infinity,
            decoration: AppDecorations.cupertinoModal,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                "Select units",
                style: AppTextStyles.pickerTitle,
              ),
            )),
        Container(
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          height: 216,
          color: AppColors.white,
          child: SafeArea(
            top: false,
            child: CupertinoPicker(
                itemExtent: 50.0,
                squeeze: 1.4,
                useMagnifier: true,
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                scrollController:
                    FixedExtentScrollController(initialItem: _selectedValue),
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text("Metric"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text("Imperial"),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
