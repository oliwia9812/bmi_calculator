import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle cardTitleSmall = TextStyle(
    color: AppColors.darkGray,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle cardTitleMedium = TextStyle(
    color: AppColors.darkGray,
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cardTitleLarge = TextStyle(
    color: AppColors.darkGray,
    fontSize: 48.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle hintText = TextStyle(
    color: AppColors.lightGray,
    fontSize: 36.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle inputText = TextStyle(
    color: AppColors.darkGray,
    fontSize: 36.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.darkGray,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle pickerTitle = TextStyle(
    color: AppColors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );
}
