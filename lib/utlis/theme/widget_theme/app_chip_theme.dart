import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppChipTheme {
  AppChipTheme._();

  // This is For Light ChipTheme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColors.grey.withValues(alpha: 0.4),
    labelStyle: TextStyle(color: AppColors.black),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AppColors.white,
  );

  // This is For Dark ChipTheme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: AppColors.darkGrey,
    labelStyle: TextStyle(color: AppColors.white),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AppColors.white,
  );
}
