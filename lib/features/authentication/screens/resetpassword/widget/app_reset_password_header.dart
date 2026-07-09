import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppResetPasswordHeader extends StatelessWidget {
  const AppResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppText.resetPassTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
