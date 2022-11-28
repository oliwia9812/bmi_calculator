import 'package:bmi_calculator/bloc/bmi_results/bmi_results_bloc.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/screens/bmi_result/widgets/bmi_result_list_item.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResultList extends StatefulWidget {
  final List<BmiResult> resultsList;
  const BmiResultList({required this.resultsList, super.key});

  @override
  State<BmiResultList> createState() => _BmiResultListState();
}

class _BmiResultListState extends State<BmiResultList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiResultsBloc, BmiResultsState>(
      builder: (context, state) {
        if (state is BmiResultsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.purple,
            ),
          );
        } else if (state is BmiResultsLoaded) {
          return GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 8.0,
            ),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            crossAxisCount: 2,
            children: List.generate(
              widget.resultsList.length,
              (index) => Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.red,
                  ),
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.delete,
                      color: AppColors.white,
                      size: 36.0,
                    ),
                  ),
                ),
                key: ValueKey(index),
                onDismissed: (direction) {
                  context.read<BmiResultsBloc>().add(
                      DeleteBmiResultsEvent(id: widget.resultsList[index].id));
                },
                child: BmiResultListItem(
                  bmiResult: widget.resultsList[index],
                ),
              ),
            ),
          );
        }

        return const Text("Something went wrong!");
      },
    );
  }
}
