import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/common/widgets/snackbars/app_snackbar.dart';
import 'package:e_nova/features/authentication/presentation/pages/resetpassword/widgets/reset_password_form.dart';
import 'package:e_nova/features/authentication/presentation/pages/resetpassword/widgets/reset_password_header.dart';
import 'package:e_nova/features/authentication/presentation/pages/resetpassword/widgets/reset_password_must_have.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
              //----------------------------------- Reset Password screen' Header-----------------------------------
              ResetPasswordHeader(),
              SizedBox(height: AppSizes.spaceBtwSections * 2),

              //----------------------------------- Reset Password screen' Form-----------------------------------
              ResetPasswordForm(
                newPasswordController: newPasswordController,
                confirmPasswordController: confirmPasswordController,
              ),
              SizedBox(height: AppSizes.spaceBtwSections * 2),

              //----------------------------------- Reset Password screen' Simplify How and what character would be in password-----------------------------------
              ResetPasswordMustHave(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // -----------------------------------Reset Password screen' Button-----------------------------------
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  btnName: AppStrings.resetPasswordBtn,
                  onTap: () {
                    if (newPasswordController.text.trim() !=
                        confirmPasswordController.text.trim()) {
                      AppSnackbar.error(
                        context,
                        message: 'Passwords do not match',
                      );
                      return;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
