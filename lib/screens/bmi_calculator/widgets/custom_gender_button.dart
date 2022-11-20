import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:flutter/material.dart';

class CustomGenderButton extends StatelessWidget {
  final String genderImage;
  final String genderTitle;
  final bool isSelected;

  const CustomGenderButton({
    required this.genderImage,
    required this.genderTitle,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: AppDecorations.card(isSelected: isSelected),
        height: 160.0,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CardLabel(labelText: genderTitle),
            SizedBox(
              height: 124.0,
              width: 124.0,
              child: Image.asset(genderImage),
            ),
          ],
        ),
      ),
    );
  }
}
