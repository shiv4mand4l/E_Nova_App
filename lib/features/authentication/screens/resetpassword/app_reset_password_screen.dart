import 'package:e_nova/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/features/authentication/screens/resetpassword/widget/app_reset_password_form.dart';
import 'package:e_nova/features/authentication/screens/resetpassword/widget/app_reset_password_header.dart';
import 'package:e_nova/features/authentication/screens/resetpassword/widget/app_reset_password_must_have.dart';
import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppResetPasswordScreen extends StatefulWidget {
  const AppResetPasswordScreen({super.key});

  @override
  State<AppResetPasswordScreen> createState() => _AppResetPasswordScreenState();
}

class _AppResetPasswordScreenState extends State<AppResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: .only(
          right: AppSizes.defaultSpace,
          left: AppSizes.defaultSpace,
          top: AppSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            //----------------------------------- Reset Password screen' Header-----------------------------------
            AppResetPasswordHeader(),
            SizedBox(height: AppSizes.spaceBtwSections * 2),

            //----------------------------------- Reset Password screen' Form-----------------------------------
            AppResetPasswordForm(),
            SizedBox(height: AppSizes.spaceBtwSections * 2),

            //----------------------------------- Reset Password screen' Simplify How and what character would be in password-----------------------------------
            AppResetPasswordMustHave(),
            SizedBox(height: AppSizes.spaceBtwSections),

            // -----------------------------------Reset Password screen' Button-----------------------------------
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                btnName: AppText.resetPasswordBtn,
                onTap: () {
                  context.go(AppRoutes.appLoginScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
