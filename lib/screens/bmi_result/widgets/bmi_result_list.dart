import 'package:bmi_calculator/screens/bmi_result/widgets/bmi_result_list_item.dart';
import 'package:flutter/material.dart';

class BmiResultList extends StatelessWidget {
  const BmiResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 8.0,
      ),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      crossAxisCount: 2,
      children: List.generate(
        10,
        (index) => const BmiResultListItem(),
      ),
    );
  }
}
