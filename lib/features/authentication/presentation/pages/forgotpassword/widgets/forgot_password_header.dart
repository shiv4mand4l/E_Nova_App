import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.forgotPassTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          AppStrings.forgotPassSubTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
