import 'package:e_nova/core/theme/widget_theme/app_elevated_button_theme.dart';
import 'package:e_nova/core/theme/widget_theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.btnName,
    required this.onTap,
  });

  final String btnName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: AppElevatedButtonTheme.darkElevatedButton.style,
      child: Text(btnName, style: AppTextTheme.darkTextTheme.titleMedium),
    );
  }
}
