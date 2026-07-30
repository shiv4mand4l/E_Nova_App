import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/common/widgets/snackbars/app_snackbar.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:e_nova/features/authentication/presentation/bloc/auth_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: .start,

        children: [
          Text(AppStrings.email, style: Theme.of(context).textTheme.bodyLarge),
          TextFormField(
            controller: emailController,

            keyboardType: .emailAddress,
            decoration: InputDecoration(
              hintText: AppStrings.emailExample,
              suffixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections * 1.5),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthForgotPassword) {
                AppSnackbar.success(
                  context,
                  message: 'Reset link sent. Check your email.',
                );
              }

              emailController.clear();
              // context.push(AppRoutes.appResetPasswordScreen);

              if (state is AuthFailure) {
                AppSnackbar.error(context, message: state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  btnName: AppStrings.sendResetLink,
                  onTap: () {
                    try {
                      context.read<AuthBloc>().add(
                        OnForgotPassword(
                          ForgotPasswordParams(email: emailController.text),
                        ),
                      );
                    } catch (e) {
                      throw e.toString();
                    }
                  },
                ),
              );
            },
          ),
          SizedBox(height: AppSizes.spaceBtwSections * 3),
          Align(
            alignment: .center,
            child: TextButton(
              onPressed: () {
                context.go(AppRoutes.appLoginScreen);
              },
              child: Text(AppStrings.backToLogin),
            ),
          ),
        ],
      ),
    );
  }
}
