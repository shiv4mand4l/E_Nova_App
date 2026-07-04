import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  // This is for Light Elevated Button
  static ElevatedButtonThemeData lightElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.lightBg,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.buttonDesabled,
      side: BorderSide(color: AppColors.lightBg),
      padding: .symmetric(vertical: AppSizes.buttonHeight),
      textStyle: TextStyle(
        fontSize: 16.0,
        color: AppColors.lightText,
        fontWeight: .bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(AppSizes.borderRadiusMd),
      ),
    ),
  );

  // This is for Dark Elevated Button
  static ElevatedButtonThemeData darkElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.lightBg,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.buttonDesabled,
      side: BorderSide(color: AppColors.lightBg),
      padding: .symmetric(
        vertical: AppSizes.buttonHeight,
        horizontal: AppSizes.buttonWidth,
      ),
      textStyle: TextStyle(
        fontSize: 16.0,
        color: AppColors.lightText,
        fontWeight: .bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(AppSizes.borderRadiusMd),
      ),
    ),
  );
}
