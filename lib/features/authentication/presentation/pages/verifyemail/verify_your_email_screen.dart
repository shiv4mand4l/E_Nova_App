import 'package:e_nova/features/authentication/presentation/pages/verifyemail/widgets/verify_email_btn.dart';
import 'package:e_nova/features/authentication/presentation/pages/verifyemail/widgets/verify_header.dart';
import 'package:e_nova/core/constants/app_images.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerifyYourEmailScreen extends StatefulWidget {
  const VerifyYourEmailScreen({super.key});

  @override
  State<VerifyYourEmailScreen> createState() => _VerifyYourEmailScreenState();
}

class _VerifyYourEmailScreenState extends State<VerifyYourEmailScreen> {
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
              VerifyEmailHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // ---------------------------------Opening Email App---------------------------------
              VerifyEmailBtn(),
              SizedBox(height: AppSizes.spaceBtwSections * 3),

              // ---------------------------------Resend Email in particular time---------------------------------
              TextButton(onPressed: () {}, child: Text(AppStrings.resendEmail)),
            ],
          ),
        ),
      ),
    );
  }
}
