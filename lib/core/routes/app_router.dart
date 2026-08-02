import 'package:e_nova/features/authentication/presentation/pages/forgotpassword/forgot_password_screen.dart';
import 'package:e_nova/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:e_nova/features/bookmarks/presentation/pages/book_mark_screen.dart';
import 'package:e_nova/features/home/presentation/pages/home_screen.dart';
import 'package:e_nova/features/mycourse/presentation/pages/my_course_screen.dart';
import 'package:e_nova/features/navigation/presentation/pages/main_screen.dart';
import 'package:e_nova/features/onboarding/presentation/pages/onboarding/app_onboarding.dart';
import 'package:e_nova/features/authentication/presentation/pages/resetpassword/reset_password_screen.dart';
import 'package:e_nova/features/authentication/presentation/pages/signup/sign_up_screen.dart';
import 'package:e_nova/features/authentication/presentation/pages/verifyemail/verify_your_email_screen.dart';
import 'package:e_nova/features/profile/presentation/pages/profile_screen.dart';
import 'package:e_nova/features/splash/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // AppRouter._();

  static final GoRouter appRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: '/onboardingScreen',
        builder: (context, state) {
          return AppOnboarding();
        },
      ),
      GoRoute(
        path: '/loginScreen',
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: '/forgotPasswordScreen',
        builder: (context, state) {
          return ForgotPasswordScreen();
        },
      ),
      GoRoute(
        path: '/resetPasswordScreen',
        builder: (context, state) {
          // log("URI: ${state.uri}");
          // log("oobCode: ${state.uri.queryParameters['oobCode']}");
          // final oobCode = state.uri.queryParameters['oobCode'];
          // if (oobCode == null) {
          //   return Scaffold(
          //     appBar: AppBar(),
          //     body: Center(child: Text('Invalid reset link')),
          //   );
          // }
          return ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: '/signUpScreen',
        builder: (context, state) {
          return SignUpScreen();
        },
      ),
      GoRoute(
        path: '/verifyYourEmailScreen',
        builder: (context, state) {
          return VerifyYourEmailScreen();
        },
      ),
      GoRoute(
        path: '/mainScreen',
        builder: (context, state) {
          return MainScreen();
        },
      ),
      GoRoute(
        path: '/homeScreen',
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: '/myCourseScreen',
        builder: (context, state) {
          return MyCourseScreen();
        },
      ),
      GoRoute(
        path: '/bookMarksScreen',
        builder: (context, state) {
          return BookMarkScreen();
        },
      ),
      GoRoute(
        path: '/profileScreen',
        builder: (context, state) {
          return ProfileScreen();
        },
      ),
    ],
  );
}
