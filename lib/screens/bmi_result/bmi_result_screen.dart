import 'package:bmi_calculator/screens/bmi_result/widgets/bmi_result_list.dart';
import 'package:bmi_calculator/shared/screen_title.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Column(
          children: [
            _buildHeader(context),
            _buildResultsList(),
          ],
        ),
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
            _buildSortIcon(),
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
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTitle() {
    return const ScreenTitle(title: "Your BMI results");
  }

  Widget _buildSortIcon() {
    return IconButton(
      icon: const Icon(Icons.sort),
      iconSize: 24.0,
      onPressed: () {},
    );
  }

  Widget _buildResultsList() {
    return const Flexible(
      child: BmiResultList(),
    );
  }
}
