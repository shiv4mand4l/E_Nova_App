import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppAppbarTheme {
  AppAppbarTheme._();

  // This is for Light AppBar
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.black, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: AppSizes.fontSizeLg,
      fontWeight: .w600,
      color: AppColors.black,
    ),
  );

  // This is for Dark AppBar
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
      fontSize: AppSizes.fontSizeLg,
      fontWeight: .w600,
      color: AppColors.white,
    ),
  );
}
