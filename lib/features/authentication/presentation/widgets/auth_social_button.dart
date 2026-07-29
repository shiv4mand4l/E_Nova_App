import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

Container authSocialButton(String socialIcon, VoidCallback onTap) {
  return Container(
    padding: .all(AppSizes.md),
    decoration: BoxDecoration(
      // color: AppColors.white,
      borderRadius: BorderRadius.circular(100),
      border: Border.all(width: 1, color: AppColors.borderSecondary),
    ),
    child: Image.asset(socialIcon, height: AppSizes.xl),
  );
}
