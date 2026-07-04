import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextfieldTheme {
  AppTextfieldTheme._();

  // This is for Light TextField
  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,

    // constraints: BoxConstraints.expand(height: TSizes.inputFIeldheight),
    labelStyle: TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      color: AppColors.black,
    ),
    hintStyle: TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      color: AppColors.black,
    ),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(
      color: AppColors.black.withValues(alpha: 0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: .circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.grey, width: 1),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.grey, width: 1),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.darkBg, width: 1),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.warning, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.warning, width: 2),
    ),
  );

  // This is for Light TextField
  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,

    // constraints: BoxConstraints.expand(height: TSizes.inputFIeldheight),
    labelStyle: TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      color: AppColors.white,
    ),
    hintStyle: TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      color: AppColors.white,
    ),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(
      color: AppColors.white.withValues(alpha: 0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: .circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.darkGrey, width: 1),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.darkGrey, width: 1),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.lightBg, width: 1),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.warning, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(color: AppColors.warning, width: 2),
    ),
  );
}
