import 'package:e_nova/core/routes/app_routes.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_event.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<OnBoardingBloc>().add(CheckAppStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state is GotoOnboarding) {
          context.go(AppRoutes.appOnboardingScreen);
        }
        if (state is GotoLogin) {
          context.go(AppRoutes.appLoginScreen);
        }
        if (state is GotoHome) {
          context.go(AppRoutes.appHomeScreen);
        }
      },
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
