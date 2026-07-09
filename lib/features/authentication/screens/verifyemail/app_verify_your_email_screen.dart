import 'package:e_nova/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_images.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AppVerifyYourEmailScreen extends StatefulWidget {
  const AppVerifyYourEmailScreen({super.key});

  @override
  State<AppVerifyYourEmailScreen> createState() =>
      _AppVerifyYourEmailScreenState();
}

class _AppVerifyYourEmailScreenState extends State<AppVerifyYourEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: .only(
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace,
            top: AppSizes.defaultSpace * 2,
          ),
          child: Column(
            children: [
              // ---------------------------------Email Image---------------------------------
              Lottie.asset(AppImages.verifyEmail),

              // ---------------------------------Title and SubTitle---------------------------------
              Column(
                children: [
                  Text(
                    AppText.verifyEmailTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Text(
                    textAlign: .center,
                    AppText.verifyEmailSubTitle,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

              // ---------------------------------Opening Email App---------------------------------
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  btnName: AppText.openEmailAppBtn,
                  onTap: () {
                    context.push(AppRoutes.appLoginScreen);
                  },
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwSections * 3),

              // ---------------------------------Resend Email in particular time---------------------------------
              TextButton(onPressed: () {}, child: Text(AppText.resendEmail)),
            ],
          ),
        ),
      ),
    );
  }
}
