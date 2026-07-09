import 'package:e_nova/features/authentication/screens/forgotpassword/app_forgot_password_screen.dart';
import 'package:e_nova/features/authentication/screens/login/app_login_screen.dart';
import 'package:e_nova/features/authentication/screens/onboarding/app_onboarding.dart';
import 'package:e_nova/features/authentication/screens/resetpassword/app_reset_password_screen.dart';
import 'package:e_nova/features/authentication/screens/signup/app_sign_up_screen.dart';
import 'package:e_nova/features/authentication/screens/verifyemail/app_verify_your_email_screen.dart';
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
          return AppLoginScreen();
        },
      ),
      GoRoute(
        path: '/appForgotPasswordScreen',
        builder: (context, state) {
          return AppForgotPasswordScreen();
        },
      ),
      GoRoute(
        path: '/appResetPasswordScreen',
        builder: (context, state) {
          return AppResetPasswordScreen();
        },
      ),
      GoRoute(
        path: '/appSignUpScreen',
        builder: (context, state) {
          return AppSignUpScreen();
        },
      ),
      GoRoute(
        path: '/appVerifyYourEmailScreen',
        builder: (context, state) {
          return AppVerifyYourEmailScreen();
        },
      ),
    ],
  );
}
