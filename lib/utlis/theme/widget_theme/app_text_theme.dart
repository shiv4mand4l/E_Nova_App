import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  // For Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    // 🔥 HEADLINE (Splash, big titles)
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.darkText,
      letterSpacing: -0.5,
    ),

    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: AppColors.darkText,
      letterSpacing: -0.25,
    ),

    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),

    // 🧭 TITLES (Screen titles, section headers)
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),

    titleMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),

    titleSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),

    // 📄 BODY (paragraphs, descriptions)
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.darkText,
      height: 1.5,
    ),

    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.darkText,
      height: 1.4,
    ),

    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.darkText.withValues(alpha: 0.5),
    ),

    // 🏷️ LABELS (buttons, chips, captions)
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
      letterSpacing: 0.2,
    ),

    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText.withValues(alpha: 0.5),
    ),
  );

  // -------------------------------------------------------------------------------------------------

  // For Dark Text Theme

  static TextTheme darkTextTheme = TextTheme(
    // 🔥 HEADLINE (Splash, big titles)
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.lightText,
      letterSpacing: -0.5,
    ),

    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: AppColors.lightText,
      letterSpacing: -0.25,
    ),

    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.lightText,
    ),

    // 🧭 TITLES (Screen titles, section headers)
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.lightText,
    ),

    titleMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightText,
    ),

    titleSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightText,
    ),

    // 📄 BODY (paragraphs, descriptions)
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.lightText,
      height: 1.5,
    ),

    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      height: 1.4,
    ),

    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.lightText.withValues(alpha: 0.5),
    ),

    // 🏷️ LABELS (buttons, chips, captions)
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    ),

    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: AppColors.lightText.withValues(alpha: 0.5),
    ),
  );
}
