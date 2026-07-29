import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAlreadyHaveAccount extends StatelessWidget {
  const AppAlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.appLoginScreen);
      },
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(text: AppStrings.alreadyHaveAcc),
            TextSpan(
              text: AppStrings.logIn,
              style: TextStyle(color: AppColors.primary, fontWeight: .bold),
            ),
          ],
        ),
      ),
    );
  }
}
