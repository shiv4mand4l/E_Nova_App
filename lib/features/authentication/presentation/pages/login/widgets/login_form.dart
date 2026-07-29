import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.email,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextField(
              keyboardType: .emailAddress,
              decoration: InputDecoration(
                // labelText: AppText.email,
                hintText: AppStrings.emailExample,
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            Text(
              AppStrings.password,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            TextField(
              decoration: InputDecoration(
                // labelText: AppText.password,
                hintText: AppStrings.passwordExample,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
          ],
        ),
        Align(
          alignment: .centerRight,
          child: Transform.translate(
            offset: Offset(0, -5),
            child: TextButton(
              onPressed: () {
                context.push(AppRoutes.appForgotPasswordScreen);
              },
              child: Text(AppStrings.forgetPassword),
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections),

        // Signin Button
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(onTap: () {}, btnName: AppStrings.logIn),
        ),
      ],
    );
  }
}
