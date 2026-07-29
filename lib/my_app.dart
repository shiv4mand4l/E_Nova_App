import 'package:e_nova/core/services/shared_pref_service.dart';
import 'package:e_nova/core/services/firebase_service.dart';
import 'package:e_nova/core/services/firestore_service.dart';
import 'package:e_nova/features/authentication/data/datasourses/remote/auth_firebase_datasource.dart';
import 'package:e_nova/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:e_nova/features/authentication/domain/usecases/login_usecase.dart';
import 'package:e_nova/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:e_nova/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:e_nova/features/onboarding/data/local/onboarding_local_data_source.dart';
import 'package:e_nova/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:e_nova/features/onboarding/domain/usecases/check_auth_status_usecase.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_bloc.dart';
import 'package:e_nova/core/routes/app_router.dart';
import 'package:e_nova/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OnBoardingBloc(
            CheckAuthStatusUsecase(
              OnboardingRepositoryImpl(
                OnboardingLocalDataSourceImpl(
                  FirebaseService(),
                  SharedPrefService(),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => AuthBloc(
            loginUseCase: LoginUsecase(
              AuthRepositoryImpl(
                AuthFirebaseDatasourceImpl(
                  FirebaseService(),
                  FirestoreService(),
                ),
              ),
            ),
            signupUsecase: SignupUsecase(
              AuthRepositoryImpl(
                AuthFirebaseDatasourceImpl(
                  FirebaseService(),
                  FirestoreService(),
                ),
              ),
            ),
          ),
        ),
      ],
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
