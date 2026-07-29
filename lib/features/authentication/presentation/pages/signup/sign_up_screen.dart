import 'package:e_nova/features/authentication/presentation/widgets/auth_social_button.dart';
import 'package:e_nova/features/authentication/presentation/pages/signup/widgets/already_have_account.dart';
import 'package:e_nova/features/authentication/presentation/pages/signup/widgets/sign_up_form.dart';
import 'package:e_nova/features/authentication/presentation/pages/signup/widgets/sign_up_header.dart';
import 'package:e_nova/core/constants/app_images.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/helpers/device_helper.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .only(
          right: AppSizes.defaultSpace,
          left: AppSizes.defaultSpace,
          top: DeviceHelper.getAppBarHeight(),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              // ------------------  Signup Header  ---------------------
              SignUpHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // -------------------------Signup Form-------------------------
              SignUpForm(),

              SizedBox(height: AppSizes.spaceBtwSections),

              // -------------------------Divider-------------------------
              SizedBox(height: AppSizes.spaceBtwSections),
              // -------------------------Social Signup or Login-------------------------
              Row(
                mainAxisAlignment: .center,
                spacing: AppSizes.spaceBtwItems,
                children: [
                  authSocialButton(AppImages.socialLogo1, () {}),
                  authSocialButton(AppImages.socialLogo2, () {}),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

              // -------------------------Already have an account? Login-------------------------
              AppAlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
