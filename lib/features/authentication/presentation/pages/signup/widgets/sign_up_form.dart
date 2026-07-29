import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // First Name or Last Name
        Row(
          spacing: AppSizes.spaceBtwItems,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwInputFields),

        // Email..........
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.email,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextFormField(
              keyboardType: .emailAddress,
              decoration: InputDecoration(hintText: AppStrings.emailExample),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            Text(
              AppStrings.password,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.passwordExample,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            Text(
              AppStrings.conformPassword,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.passwordExample,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
          ],
        ),
        Transform.translate(
          offset: Offset(0, -10),
          child: Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColors.primary, fontWeight: .bold),
                  children: [
                    TextSpan(
                      text: AppStrings.privacyPolicyPart1,
                      style: TextStyle(
                        color: isDark ? AppColors.white : AppColors.darkGrey,
                      ),
                    ),
                    TextSpan(text: AppStrings.privacyPolicypart2),
                    TextSpan(
                      text: AppStrings.privacyPolicyPart3,
                      style: TextStyle(
                        color: isDark ? AppColors.white : AppColors.darkGrey,
                      ),
                    ),
                    TextSpan(text: AppStrings.privacyPolicyPart4),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            btnName: AppStrings.signUp,
            onTap: () {
              context.push(AppRoutes.appVerifyYourEmailScreen);
            },
          ),
        ),
      ],
    );
  }
}
