import 'package:flutter/material.dart';

class DeviceHelper {
  DeviceHelper._();

  static double getAppBarHeight() {
    return kToolbarHeight * 2;
  }

  static double getBottonNavBarHeight() {
    return kBottomNavigationBarHeight * 3.5;
  }
}
