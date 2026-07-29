import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/theme/widget_theme/app_appbar_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_bottomsheet_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_checkbox_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_chip_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_elevated_button_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_outline_button_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_text_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_textfield_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor
  AppTheme._();

  // This is for Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: .light,
    primaryColor: AppColors.primary,
    disabledColor: AppColors.grey,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.lightBg,
    appBarTheme: AppAppbarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: AppBottomsheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButton,
    outlinedButtonTheme: AppOutlineButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextfieldTheme.lightTextFieldTheme,
  );

  // This is for Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: .dark,
    primaryColor: AppColors.primary,
    disabledColor: AppColors.grey,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColors.darkBg,
    appBarTheme: AppAppbarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme: AppBottomsheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButton,
    outlinedButtonTheme: AppOutlineButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextfieldTheme.darkTextFieldTheme,
  );
}
