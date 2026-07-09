import 'package:e_nova/routes/app_routes.dart';
import 'package:e_nova/utlis/constants/app_colors.dart';
import 'package:e_nova/utlis/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAlreadyHaveAnAccount extends StatelessWidget {
  const AppAlreadyHaveAnAccount({super.key});

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
            TextSpan(text: AppText.alreadyHaveAcc),
            TextSpan(
              text: AppText.logIn,
              style: TextStyle(color: AppColors.primary, fontWeight: .bold),
            ),
          ],
        ),
      ),
    );
  }
}
