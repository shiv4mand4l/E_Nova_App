import 'package:e_nova/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppForgotPasswordForm extends StatelessWidget {
  const AppForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,

      children: [
        Text(AppText.email, style: Theme.of(context).textTheme.bodyLarge),
        TextFormField(
          decoration: InputDecoration(
            hintText: AppText.emailExample,
            suffixIcon: Icon(Iconsax.direct_right),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections * 1.5),
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(
            btnName: AppText.sendResetLink,
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
            child: Text(AppText.backToLogin),
          ),
        ),
      ],
    );
  }
}
