import 'dart:developer';

import 'package:e_nova/core/common/widgets/loaders/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_nova/core/common/widgets/buttons/app_elevated_button.dart';
import 'package:e_nova/core/common/widgets/snackbars/app_snackbar.dart';
import 'package:e_nova/core/constants/app_colors.dart';
import 'package:e_nova/core/constants/app_sizes.dart';
import 'package:e_nova/core/constants/app_strings.dart';
import 'package:e_nova/core/helpers/validator.dart';
import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';
import 'package:e_nova/features/authentication/presentation/bloc/auth_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController conformPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Form(
      key: _formKey,

      child: Column(
        children: [
          // First Name or Last Name
          Row(
            spacing: AppSizes.spaceBtwItems,
            children: [
              Expanded(
                child: TextFormField(
                  validator: AppValidator.validateFirstName,
                  controller: firstNameController,
                  decoration: InputDecoration(
                    hintText: AppStrings.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: AppValidator.validateLastName,
                  controller: lastNameController,
                  decoration: InputDecoration(
                    hintText: AppStrings.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email..........
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
                  hintText: AppStrings.emailExample,
                  helperText: '',
                  helperStyle: TextStyle(fontSize: 12, height: 1.0),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
              Text(
                AppStrings.password,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bool isPasswordObsecure =
                      state is AuthIsPasswordObsecure
                      ? state.isPasswordObscure
                      : true;
                  return TextFormField(
                    obscureText: isPasswordObsecure,
                    validator: AppValidator.validatePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: AppStrings.passwordExample,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            OnAuthPasswordObsecure(!isPasswordObsecure),
                          );
                        },
                        icon: isPasswordObsecure
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
              Flexible(
                child: Text(
                  AppStrings.conformPassword,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bool isConfirmPasswordObsecure =
                      state is AuthIsPasswordObsecure
                      ? state.isConfirmPasswordObscure
                      : true;

                  return TextFormField(
                    obscureText: isConfirmPasswordObsecure,
                    validator: (value) => AppValidator.validateConfirmPassword(
                      passwordController.text,
                      value,
                    ),
                    controller: conformPasswordController,
                    decoration: InputDecoration(
                      hintText: AppStrings.passwordExample,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            OnAuthConfirmPasswordObsecure(
                              !isConfirmPasswordObsecure,
                            ),
                          );
                        },
                        icon: isConfirmPasswordObsecure
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSizes.spaceBtwInputFields),
            ],
          ),
          Transform.translate(
            offset: Offset(0, -10),
            child: Row(
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final bool isAccepted = state is AuthTermsChanged
                        ? state.isAccepted
                        : false;
                    return Checkbox(
                      value: isAccepted,
                      onChanged: (value) {
                        context.read<AuthBloc>().add(
                          OnTermsAcceptedChanged(value ?? false),
                        );
                      },
                    );
                  },
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: .bold,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.privacyPolicyPart1,
                        style: TextStyle(
                          color: isDark ? AppColors.white : AppColors.darkGrey,
                        ),
                      ),
                      TextSpan(text: AppStrings.privacyPolicypart2),
                      TextSpan(
                        text: AppStrings.privacyPolicyPart3,
                        style: TextStyle(
                          color: isDark ? AppColors.white : AppColors.darkGrey,
                        ),
                      ),
                      TextSpan(text: AppStrings.privacyPolicyPart4),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  AppSnackbar.success(
                    context,
                    message: 'Account Created Successfully🎉',
                  );

                  firstNameController.clear();
                  lastNameController.clear();
                  emailController.clear();
                  passwordController.clear();
                  conformPasswordController.clear();

                  context.go(AppRoutes.loginScreen);
                }

                if (state is AuthFailure) {
                  log(state.message);
                  AppSnackbar.error(context, message: state.message);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: AppLoader());
                }
                final bool isAccepted = state is AuthTermsChanged
                    ? state.isAccepted
                    : false;
                return AppElevatedButton(
                  btnName: AppStrings.signUp,
                  onTap: isAccepted
                      ? () {
                          try {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                OnAuthSignUp(
                                  SignUpParams(
                                    firstName: firstNameController.text.trim(),
                                    lastName: lastNameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    confirmPassword: conformPasswordController
                                        .text
                                        .trim(),
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            throw e.toString();
                          }
                        }
                      : () {
                          // ----------------------------------- PopUp banner here---------------------------------------------
                          AppSnackbar.warning(
                            context,
                            message: 'Something is missing...',
                          );
                        },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
