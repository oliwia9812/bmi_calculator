import 'package:bmi_calculator/bloc/bmi_results/bmi_results_bloc.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortPicker extends StatefulWidget {
  const SortPicker({super.key});

  @override
  State<SortPicker> createState() => _SortPickerState();
}

class _SortPickerState extends State<SortPicker> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    switch (_selectedValue) {
      case 0:
        context
            .read<BmiResultsBloc>()
            .add(const GetBmiResultsEvent(sortBy: SortBy.dateDesc));
        break;
      case 1:
        context
            .read<BmiResultsBloc>()
            .add(const GetBmiResultsEvent(sortBy: SortBy.dateAsc));
        break;
      case 2:
        context
            .read<BmiResultsBloc>()
            .add(const GetBmiResultsEvent(sortBy: SortBy.bmiResultDesc));
        break;
      case 3:
        context
            .read<BmiResultsBloc>()
            .add(const GetBmiResultsEvent(sortBy: SortBy.bmiResultAsc));
        break;
      default:
    }

    return Container(
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
            scrollController: FixedExtentScrollController(
              initialItem: _selectedValue,
            ),
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Sort by date (descending)"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Sort by date (ascending)"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Sort by BMI result (descending)"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Sort by BMI result (ascending)"),
              ),
            ]),
      ),
    );
  }
}
