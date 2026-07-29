import 'package:flutter/material.dart';

class AppSnackbar {
  AppSnackbar._();

  static void success(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle_rounded,
    );
  }

  static void error(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error_rounded,
    );
  }

  static void warning(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning_rounded,
    );
  }

  static void info(BuildContext context, {required String message}) {
    _show(
      context,
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info_rounded,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(16),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: backgroundColor.withValues(alpha: .35),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
