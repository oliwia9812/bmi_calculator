import 'package:bmi_calculator/bloc/bmi_results/bmi_results_bloc.dart';
import 'package:bmi_calculator/models/bmi_result.dart';
import 'package:bmi_calculator/screens/bmi_calculator/bmi_calculator_screen.dart';
import 'package:bmi_calculator/screens/bmi_result/widgets/bmi_result_list.dart';
import 'package:bmi_calculator/screens/bmi_result/widgets/sort_picker.dart';
import 'package:bmi_calculator/shared/screen_title.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<BmiResultsBloc, BmiResultsState>(
        builder: (context, state) {
          if (state is BmiResultsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            );
          } else if (state is BmiResultsLoaded) {
            List<BmiResult> resultsList = state.results;
            return SafeArea(
              minimum: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildResultsList(resultsList),
                ],
              ),
            );
          }
          return const Text("Something went wrong!");
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBackButton(context),
            _buildTitle(),
            _buildSortButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      iconSize: 24.0,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BmiCalculatorScreen(),
            ));
      },
    );
  }

  Widget _buildTitle() {
    return const ScreenTitle(title: "Your BMI results");
  }

  Widget _buildSortButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => const SortPicker(),
          );
        },
        icon: const Icon(Icons.sort));
  }

  Widget _buildResultsList(List<BmiResult> resultsList) {
    return Flexible(
      child: BmiResultList(
        resultsList: resultsList,
      ),
    );
  }
}
