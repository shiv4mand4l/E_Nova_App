import 'package:e_nova/features/screens/onboarding/onboardingbloc/bloc/on_boarding_bloc.dart';
import 'package:e_nova/routes/app_router.dart';
import 'package:e_nova/utlis/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingBloc(),
      child: MaterialApp.router(
        routerConfig: AppRouter.appRouter,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
