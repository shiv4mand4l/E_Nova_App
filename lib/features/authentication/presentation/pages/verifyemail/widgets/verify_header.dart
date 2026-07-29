import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class VerifyEmailHeader extends StatelessWidget {
  const VerifyEmailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.verifyEmailTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          textAlign: .center,
          AppStrings.verifyEmailSubTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
