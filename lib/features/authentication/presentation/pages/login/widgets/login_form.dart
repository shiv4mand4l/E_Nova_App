import 'dart:developer';

import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/common/widgets/snackbars/app_snackbar.dart';
import 'package:e_nova/core/helpers/validator.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                AppStrings.email,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextFormField(
                validator: AppValidator.validateEmail,
                controller: emailController,

                keyboardType: .emailAddress,
                decoration: InputDecoration(
                  // labelText: AppText.email,
                  hintText: AppStrings.emailExample,
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
              Text(
                AppStrings.password,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bool isPasswordObscure = state is AuthIsPasswordObsecure
                      ? state.isPasswordObscure
                      : true;
                  return TextFormField(
                    obscureText: isPasswordObscure,
                    validator: AppValidator.validatePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      // labelText: AppText.password,
                      hintText: AppStrings.passwordExample,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            OnAuthPasswordObsecure(!isPasswordObscure),
                          );
                        },
                        icon: isPasswordObscure
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: .centerRight,
            child: Transform.translate(
              offset: Offset(0, -5),
              child: TextButton(
                onPressed: () {
                  context.push(AppRoutes.appForgotPasswordScreen);
                },
                child: Text(AppStrings.forgetPassword),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections),

          // Signin Button
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                log('Loged in');
                AppSnackbar.success(context, message: 'Login Successfully🎉');

                emailController.clear();
                passwordController.clear();

                context.go(AppRoutes.appHomeScreen);
              }

              if (state is AuthFailure) {
                log('failure in');

                AppSnackbar.error(context, message: state.message);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                log('loading in');

                return Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  onTap: () {
                    try {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          OnAuthLogIn(
                            LogInParams(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      throw e.toString();
                    }
                  },
                  btnName: AppStrings.logIn,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
