import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(indent: 3, endIndent: 20)),
        Text(AppStrings.orContinueWith),
        Expanded(child: Divider(indent: 20, endIndent: 3)),
      ],
    );
  }
}
