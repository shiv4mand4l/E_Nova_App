import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.logInTitle,
          textAlign: .center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          AppStrings.logInSubTitle,
          textAlign: .center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
