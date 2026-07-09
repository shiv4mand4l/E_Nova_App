import 'package:e_nova/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(AppText.email, style: Theme.of(context).textTheme.bodyLarge),
            TextField(
              decoration: InputDecoration(
                // labelText: AppText.email,
                hintText: AppText.emailExample,
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwInputFields),
            Text(
              AppText.password,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            TextField(
              decoration: InputDecoration(
                // labelText: AppText.password,
                hintText: AppText.passwordExample,
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
              child: Text(AppText.forgetPassword),
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections),

        // Signin Button
        SizedBox(
          width: double.infinity,
          child: AppElevatedButton(onTap: () {}, btnName: AppText.logIn),
        ),
      ],
    );
  }
}
