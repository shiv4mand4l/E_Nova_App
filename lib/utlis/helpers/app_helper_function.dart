import 'package:flutter/material.dart';

class AppHelperFunction {
  AppHelperFunction._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
