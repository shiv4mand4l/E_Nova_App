import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.resetPassTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
