import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? limitingNumber;

  const CustomTextFormField({
    required this.onChange,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.limitingNumber = 3,
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
          LengthLimitingTextInputFormatter(limitingNumber),
        ],
        keyboardType: TextInputType.number,
        style: AppTextStyles.inputText,
        textAlign: TextAlign.center,
        onChanged: onChange,
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }
}
