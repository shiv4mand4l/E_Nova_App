import 'package:e_nova/features/authentication/presentation/pages/forgotpassword/forgot_password_screen.dart';
import 'package:e_nova/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:e_nova/features/onboarding/presentation/pages/onboarding/app_onboarding.dart';
import 'package:e_nova/features/authentication/presentation/pages/resetpassword/reset_password_screen.dart';
import 'package:e_nova/features/authentication/presentation/pages/signup/sign_up_screen.dart';
import 'package:e_nova/features/authentication/presentation/pages/verifyemail/verify_your_email_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // AppRouter._();

  static final GoRouter appRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return AppOnboarding();
        },
      ),
      GoRoute(
        path: '/appLoginScreen',
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: '/appForgotPasswordScreen',
        builder: (context, state) {
          return ForgotPasswordScreen();
        },
      ),
      GoRoute(
        path: '/appResetPasswordScreen',
        builder: (context, state) {
          return ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: '/appSignUpScreen',
        builder: (context, state) {
          return SignUpScreen();
        },
      ),
      GoRoute(
        path: '/appVerifyYourEmailScreen',
        builder: (context, state) {
          return VerifyYourEmailScreen();
        },
      ),
    ],
  );
}
