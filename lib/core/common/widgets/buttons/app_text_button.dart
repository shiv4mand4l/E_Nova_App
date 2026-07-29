import 'package:e_nova/core/theme/widget_theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.txtBtnName,
    required this.onTap,
  });

  final String txtBtnName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(txtBtnName, style: AppTextTheme.lightTextTheme.labelSmall),
    );
  }
}
