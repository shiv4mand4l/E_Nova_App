import 'package:e_nova/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppSignUpForm extends StatelessWidget {
  const AppSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Name or Last Name
        Row(
          spacing: AppSizes.spaceBtwItems,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppText.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppText.lastName,
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
            Text(AppText.email, style: Theme.of(context).textTheme.bodyLarge),
            TextFormField(
              decoration: InputDecoration(hintText: AppText.emailExample),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            Text(
              AppText.password,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppText.passwordExample,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            Text(
              AppText.conformPassword,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppText.passwordExample,
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
                      text: AppText.privacyPolicyPart1,
                      style: TextStyle(color: AppColors.white),
                    ),
                    TextSpan(text: AppText.privacyPolicypart2),
                    TextSpan(
                      text: AppText.privacyPolicyPart3,
                      style: TextStyle(color: AppColors.white),
                    ),
                    TextSpan(text: AppText.privacyPolicyPart4),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            btnName: AppText.signUp,
            onTap: () {
              context.push(AppRoutes.appVerifyYourEmailScreen);
            },
          ),
        ),
      ],
    );
  }
}
