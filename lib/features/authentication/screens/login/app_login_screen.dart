import 'package:e_nova/common/widgets/login_signup/app_divider_or_continue_with.dart';
import 'package:e_nova/common/widgets/buttons/social_icon_button.dart';
import 'package:e_nova/features/authentication/screens/login/widget/app_create_account_or_sign_up.dart';
import 'package:e_nova/features/authentication/screens/login/widget/app_login_form.dart';
import 'package:e_nova/features/authentication/screens/login/widget/app_login_header.dart';
import 'package:e_nova/utlis/constants/app_images.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/helpers/app_device_helper.dart';
import 'package:flutter/material.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen({super.key});

  @override
  State<AppLoginScreen> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends State<AppLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: .only(
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace,
            top: AppDeviceHelper.getAppBarHeight(),
          ),

          child: Column(
            mainAxisAlignment: .center,
            children: [
              // Hearder Section
              AppLoginHeader(),
              SizedBox(height: AppSizes.spaceBtwSections * 2),

              // Form Section
              AppLoginForm(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Divider Items
              AppDividerOrContinueWith(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Social Buttons/Items
              Row(
                mainAxisAlignment: .center,
                spacing: AppSizes.spaceBtwItems,
                children: [
                  buildButton(AppImages.socialLogo1, () {}),
                  buildButton(AppImages.socialLogo2, () {}),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwSections * 4.5),

              // Register Section
              CreateAccountOrSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
