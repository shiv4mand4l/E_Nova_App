import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomsheetTheme {
  AppBottomsheetTheme._();

  // This is for Light BottomSheet Theme
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.white,
    modalBackgroundColor: AppColors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: .circular(16.0)),
  );

  // This is for Dark BottomSheet Theme
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColors.black,
    modalBackgroundColor: AppColors.black,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: .circular(16.0)),
  );
}
