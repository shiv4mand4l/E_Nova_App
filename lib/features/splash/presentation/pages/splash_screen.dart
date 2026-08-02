import 'package:e_nova/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/repositories/splash_repository.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(SplashStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigate) {
          switch (state.status) {
            case AppStartStatus.home:
              context.go(AppRoutes.mainScreen);
              break;

            case AppStartStatus.login:
              context.go(AppRoutes.loginScreen);
              break;

            case AppStartStatus.onboarding:
              context.go(AppRoutes.onboardingScreen);
              break;
          }
        }
      },

      child: const Scaffold(body: SizedBox()),
    );
  }
}
