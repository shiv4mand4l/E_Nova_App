import 'package:e_nova/common/widgets/buttons/social_icon_button.dart';
import 'package:e_nova/features/authentication/screens/signup/widget/already_have_an_account.dart';
import 'package:e_nova/features/authentication/screens/signup/widget/app_sign_up_form.dart';
import 'package:e_nova/features/authentication/screens/signup/widget/app_sign_up_header.dart';
import 'package:e_nova/utlis/constants/app_images.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/helpers/app_device_helper.dart';
import 'package:flutter/material.dart';

class AppSignUpScreen extends StatefulWidget {
  const AppSignUpScreen({super.key});

  @override
  State<AppSignUpScreen> createState() => _AppSignUpScreenState();
}

class _AppSignUpScreenState extends State<AppSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .only(
          right: AppSizes.defaultSpace,
          left: AppSizes.defaultSpace,
          top: AppDeviceHelper.getAppBarHeight(),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              // ------------------  Signup Header  ---------------------
              AppSignUpHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // -------------------------Signup Form-------------------------
              AppSignUpForm(),

              SizedBox(height: AppSizes.spaceBtwSections),

              // -------------------------Divider-------------------------
              SizedBox(height: AppSizes.spaceBtwSections),
              // -------------------------Social Signup or Login-------------------------
              Row(
                mainAxisAlignment: .center,
                spacing: AppSizes.spaceBtwItems,
                children: [
                  buildButton(AppImages.socialLogo1, () {}),
                  buildButton(AppImages.socialLogo2, () {}),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

              // -------------------------Already have an account? Login-------------------------
              AppAlreadyHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
