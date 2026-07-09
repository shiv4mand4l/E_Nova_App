import 'package:e_nova/features/authentication/screens/forgotpassword/widget/app_forgot_password_form.dart';
import 'package:e_nova/features/authentication/screens/forgotpassword/widget/app_forgot_password_header.dart';
import 'package:e_nova/utlis/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppForgotPasswordScreen extends StatefulWidget {
  const AppForgotPasswordScreen({super.key});

  @override
  State<AppForgotPasswordScreen> createState() =>
      _AppForgotPasswordScreenState();
}

class _AppForgotPasswordScreenState extends State<AppForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: .only(
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace,
            top: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: .start,

            children: [
              //---------------------------- Forgot password Header----------------------------
              AppForgotPasswordHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // ----------------------------Forgot password Form or Text Button----------------------------
              AppForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
