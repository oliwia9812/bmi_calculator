import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppDecorations {
  static BoxDecoration card({bool? isSelected}) => BoxDecoration(
        border: isSelected != null && isSelected
            ? Border.all(width: 2.0, color: AppColors.purple)
            : null,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, .15),
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
        color: AppColors.white,
      );

  static InputDecoration inputDecoration({required String hintText}) =>
      InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGray,
            width: 2,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.purple,
            width: 2,
          ),
        ),
        hintStyle: AppTextStyles.hintText,
        hintText: hintText,
      );

  static BoxDecoration cupertinoModal = const BoxDecoration(
    color: AppColors.white,
    border: Border(
      bottom: BorderSide(
        color: Color(0xff999999),
        width: 0.0,
      ),
    ),
  );
}
