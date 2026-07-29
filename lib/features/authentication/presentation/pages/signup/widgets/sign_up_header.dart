import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: .center,
          AppStrings.signUpTitle,
          style: TextTheme.of(context).headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          textAlign: .center,
          AppStrings.signUpSubTitle,
          style: TextTheme.of(context).titleSmall,
        ),
      ],
    );
  }
}
