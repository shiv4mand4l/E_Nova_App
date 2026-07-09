import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountOrSignUp extends StatelessWidget {
  const CreateAccountOrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.appSignUpScreen);
      },
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(text: AppText.createAccount),
            TextSpan(
              text: AppText.signUp,
              style: TextStyle(color: AppColors.primary, fontWeight: .bold),
            ),
          ],
        ),
      ),
    );
  }
}
