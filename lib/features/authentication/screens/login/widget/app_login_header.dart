import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppLoginHeader extends StatelessWidget {
  const AppLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppText.signinTitle,
          textAlign: .center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          AppText.signinSubTitle,
          textAlign: .center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
