import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:e_nova/core/helpers/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordForm extends StatefulWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  const ResetPasswordForm({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  // final TextEditingController newPasswordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: .start,

        children: [
          Text(
            AppStrings.newPassword,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextFormField(
            controller: widget.newPasswordController,
            validator: AppValidator.validatePassword,
            decoration: InputDecoration(
              hintText: AppStrings.passwordExample,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwItems),

          Text(
            AppStrings.conformNewaPssword,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextFormField(
            controller: widget.confirmPasswordController,
            validator: AppValidator.validatePassword,
            decoration: InputDecoration(
              hintText: AppStrings.passwordExample,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
        ],
      ),
    );
  }
}
