import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppOutlineButtonTheme {
  AppOutlineButtonTheme._();

  // This is for Light OutlinedButton Theme
  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.darkBg,
          side: BorderSide(color: AppColors.borderPrimary),
          textStyle: TextStyle(
            fontSize: 16.0,
            color: AppColors.black,
            fontWeight: .bold,
          ),

          padding: .symmetric(
            vertical: AppSizes.buttonHeight,
            horizontal: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: .circular(AppSizes.buttonRadius),
          ),
        ),
      );

  // This is for Light OutlinedButton Theme
  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.lightBg,
          side: BorderSide(color: AppColors.borderPrimary),
          textStyle: TextStyle(
            fontSize: 16.0,
            color: AppColors.black,
            fontWeight: .bold,
          ),

          padding: .symmetric(
            vertical: AppSizes.buttonHeight,
            horizontal: 20.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: .circular(AppSizes.buttonRadius),
          ),
        ),
      );
}
