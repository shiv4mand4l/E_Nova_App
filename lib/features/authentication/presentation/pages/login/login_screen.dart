import 'package:e_nova/core/common/widgets/snackbars/app_snackbar.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:e_nova/features/authentication/presentation/widgets/auth_divider.dart';
import 'package:e_nova/features/authentication/presentation/widgets/auth_social_button.dart';
import 'package:e_nova/features/authentication/presentation/pages/login/widgets/create_account_or_sign_up.dart';
import 'package:e_nova/features/authentication/presentation/pages/login/widgets/login_form.dart';
import 'package:e_nova/features/authentication/presentation/pages/login/widgets/login_header.dart';
import 'package:e_nova/core/constants/app_images.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/helpers/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .only(
          right: AppSizes.defaultSpace,
          left: AppSizes.defaultSpace,
          top: DeviceHelper.getAppBarHeight(),
        ),

        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthSuccess) {
              AppSnackbar.success(context, message: 'Login Successfully🎉');

              if (!context.mounted) return;
              context.pushReplacement(AppRoutes.appHomeScreen);
            }
            if (state is AuthFailure) {
              AppSnackbar.error(context, message: state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  // Hearder Section
                  LoginHeader(),
                  SizedBox(height: AppSizes.spaceBtwSections * 2),

                  // Form Section
                  LoginForm(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // Divider Items
                  AuthDivider(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // Social Buttons/Items
                  Row(
                    mainAxisAlignment: .center,
                    spacing: AppSizes.spaceBtwItems,
                    children: [
                      authSocialButton(AppImages.socialLogo1, () {}),
                      authSocialButton(AppImages.socialLogo2, () {}),
                    ],
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections * 3),

                  // Register Section
                  CreateAccountOrSignUp(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
