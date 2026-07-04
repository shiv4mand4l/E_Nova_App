import 'package:e_nova/features/screens/login/app_login_screen.dart';
import 'package:e_nova/features/screens/onboarding/app_onboarding.dart';
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
    ],
  );
}
