import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';

class AppResetPasswordMustHave extends StatelessWidget {
  const AppResetPasswordMustHave({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          AppText.passMustContain,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            Checkbox(
              value: true,

              fillColor: WidgetStatePropertyAll(AppColors.success),
              onChanged: (value) {},
            ),
            Text(
              AppText.atLeast8Character,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: true,

              fillColor: WidgetStatePropertyAll(AppColors.success),

              onChanged: (value) {},
            ),
            Text(
              AppText.oneUpperCaseLetter,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: true,
              fillColor: WidgetStatePropertyAll(AppColors.success),

              onChanged: (value) {},
            ),
            Text(
              AppText.oneNumber,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
