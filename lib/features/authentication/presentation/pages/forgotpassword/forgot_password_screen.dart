import 'package:e_nova/features/authentication/presentation/pages/forgotpassword/widgets/forgot_password_form.dart';
import 'package:e_nova/features/authentication/presentation/pages/forgotpassword/widgets/forgot_password_header.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
              ForgotPasswordHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // ----------------------------Forgot password Form or Text Button----------------------------
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
