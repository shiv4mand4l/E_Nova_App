import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ResetPasswordMustHave extends StatelessWidget {
  const ResetPasswordMustHave({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          AppStrings.passMustContain,
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
              AppStrings.atLeast8Character,
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
              AppStrings.oneUpperCaseLetter,
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
              AppStrings.oneNumber,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
