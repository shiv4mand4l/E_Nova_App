import 'package:flutter/material.dart';

class AppDeviceHelper {
  AppDeviceHelper._();

  static double getAppBarHeight() {
    return kToolbarHeight * 2;
  }

  static double getBottonNavBarHeight() {
    return kBottomNavigationBarHeight * 3.5;
  }
}
