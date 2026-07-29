import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailBtn extends StatelessWidget {
  const VerifyEmailBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppElevatedButton(
        btnName: AppStrings.openEmailAppBtn,
        onTap: () {
          context.push(AppRoutes.appLoginScreen);
        },
      ),
    );
  }
}
