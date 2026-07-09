import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppResetPasswordForm extends StatelessWidget {
  const AppResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,

      children: [
        Text(AppText.newPassword, style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(
          decoration: InputDecoration(
            hintText: AppText.passwordExample,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),

        Text(
          AppText.conformNewaPssword,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: AppText.passwordExample,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
      ],
    );
  }
}
