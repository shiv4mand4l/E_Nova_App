import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppForgotPasswordHeader extends StatelessWidget {
  const AppForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppText.forgotPassTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          AppText.forgotPassSubTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
