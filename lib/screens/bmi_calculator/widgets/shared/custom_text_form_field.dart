import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChange;
  const CustomTextFormField({
    required this.onChange,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        cursorColor: AppColors.purple,
        decoration: AppDecorations.inputDecoration(
          hintText: hintText,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ],
        keyboardType: TextInputType.number,
        style: AppTextStyles.inputText,
        textAlign: TextAlign.center,
        onChanged: onChange,
      ),
    );
  }
}
