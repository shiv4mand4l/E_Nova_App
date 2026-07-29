import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,

      children: [
        Text(
          AppStrings.newPassword,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: AppStrings.passwordExample,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),

        Text(
          AppStrings.conformNewaPssword,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: AppStrings.passwordExample,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
      ],
    );
  }
}
