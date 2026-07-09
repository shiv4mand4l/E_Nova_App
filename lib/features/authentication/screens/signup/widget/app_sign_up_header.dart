import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppSignUpHeader extends StatelessWidget {
  const AppSignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: .center,
          AppText.signUpTitle,
          style: TextTheme.of(context).headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          textAlign: .center,
          AppText.signUpSubTitle,
          style: TextTheme.of(context).titleSmall,
        ),
      ],
    );
  }
}
