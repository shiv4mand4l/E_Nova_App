// ignore_for_file: prefer_initializing_formals

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_nova/features/authentication/domain/entities/user_entity.dart';
import 'package:e_nova/features/authentication/domain/usecases/forgot_password_usecase.dart';
import 'package:e_nova/features/authentication/domain/usecases/login_usecase.dart';
import 'package:e_nova/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:e_nova/features/authentication/params/forgot_password_params.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase _signupUsecase;
  final LoginUsecase _loginUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  AuthBloc({
    required SignupUsecase signupUsecase,
    required LoginUsecase loginUseCase,
    required ForgotPasswordUsecase forgotPasswordUsecase,
  }) : _signupUsecase = signupUsecase,
       _loginUsecase = loginUseCase,
       _forgotPasswordUsecase = forgotPasswordUsecase,
       super(AuthInitial()) {
    on<OnAuthSignUp>(_onAuthSignUp);
    on<OnAuthLogIn>(_onAuthLogIn);
    on<OnTermsAcceptedChanged>(_onTermsAcceptedChanged);
    on<OnAuthPasswordObsecure>(_onAuthPasswordObsecure);
    on<OnAuthConfirmPasswordObsecure>(_onAuthConfirmPasswordObsecure);
    on<OnForgotPassword>(_onForgotPassword);
  }

  // ----------------------------[For OnForgotPassword Event-Function]--------------------------------------------------------------------------------------
  Future<void> _onForgotPassword(
    OnForgotPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _forgotPasswordUsecase.authRepository.forgotPassword(
        forgotPasswordParams: ForgotPasswordParams(
          email: event.forgotPasswordParams.email,
        ),
      );
      emit(AuthForgotPassword());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // --------------------------[For Eye Icon Which will secure or not OnAuthPasswordObsecure Event-Function]---------------------------------------------------

  Future<void> _onAuthConfirmPasswordObsecure(
    OnAuthConfirmPasswordObsecure event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthIsPasswordObsecure(
        isPasswordObscure: state is AuthIsPasswordObsecure
            ? (state as AuthIsPasswordObsecure).isPasswordObscure
            : true,

        isConfirmPasswordObscure: event.isConfirmPasswordObsecure,
      ),
    );
  }

  Future<void> _onAuthPasswordObsecure(
    OnAuthPasswordObsecure event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthIsPasswordObsecure(
        isPasswordObscure: event.isPasswordObsecure,
        isConfirmPasswordObscure: state is AuthIsPasswordObsecure
            ? (state as AuthIsPasswordObsecure).isConfirmPasswordObscure
            : true,
      ),
    );
  }

  // -------------------[for OnTermsAcceptedChanged Event-Function ]--------------------------------------------------------------------------
  Future<void> _onTermsAcceptedChanged(
    OnTermsAcceptedChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthTermsChanged(event.isAccepted));
  }

  // -------------------[for OnAuthLogIn Event-Function]--------------------------------------------------------------------------
  Future<void> _onAuthLogIn(OnAuthLogIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final result = await _loginUsecase.authRepository.logIn(
        logInParams: LogInParams(
          email: event.logInParams.email,
          password: event.logInParams.password,
        ),
      );

      result.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (success) {
          emit(AuthSuccess(success));
        },
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // -------------------[for OnAuthSignUp Event-Function]--------------------------------------------------------------------------
  Future<void> _onAuthSignUp(
    OnAuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await _signupUsecase.authRepository.signUp(
        signUpParams: SignUpParams(
          firstName: event.signUpParams.firstName,
          lastName: event.signUpParams.lastName,
          email: event.signUpParams.email,
          password: event.signUpParams.password,
          confirmPassword: event.signUpParams.confirmPassword,
        ),
      );
      result.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (success) {
          emit(AuthSuccess(success));
        },
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
