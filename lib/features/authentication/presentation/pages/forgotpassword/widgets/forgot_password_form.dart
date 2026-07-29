import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,

      children: [
        Text(AppStrings.email, style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(
          keyboardType: .emailAddress,
          decoration: InputDecoration(
            hintText: AppStrings.emailExample,
            suffixIcon: Icon(Iconsax.direct_right),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections * 1.5),
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            btnName: AppStrings.sendResetLink,
            onTap: () {
              context.push(AppRoutes.appResetPasswordScreen);
            },
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections * 3),
        Align(
          alignment: .center,
          child: TextButton(
            onPressed: () {
              context.go(AppRoutes.appLoginScreen);
            },
            child: Text(AppStrings.backToLogin),
          ),
        ),
      ],
    );
  }
}
