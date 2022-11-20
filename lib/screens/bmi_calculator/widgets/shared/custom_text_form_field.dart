import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  const CustomTextFormField({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: AppTextStyles.inputText,
        cursorColor: AppColors.purple,
        decoration: AppDecorations.inputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
