import 'package:e_nova/features/authentication/domain/entities/user_entity.dart';
import 'package:e_nova/features/authentication/domain/usecases/login_usecase.dart';
import 'package:e_nova/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:e_nova/features/authentication/params/log_in_params.dart';
import 'package:e_nova/features/authentication/params/sign_up_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase _signupUsecase;
  final LoginUsecase _loginUsecase;
  AuthBloc({
    required SignupUsecase signupUsecase,
    required LoginUsecase loginUseCase,
  })
    // ignore: prefer_initializing_formals
    : _signupUsecase = signupUsecase,
       _loginUsecase = loginUseCase,
       super(AuthInitial()) {
    on<OnTermsAcceptedChanged>(_onTermsAcceptedChanged);
    on<OnAuthSignUp>(_onAuthSignUp);
    on<OnAuthLogIn>(_onAuthSignIn);
  }

  // -------------------[for OnTermsAcceptedChanged Event-Function ]--------------------------------------------------------------------------
  Future<void> _onTermsAcceptedChanged(
    OnTermsAcceptedChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthTermsChanged(event.isAccepted));
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

  // -------------------[for OnAuthSignIn Event-Function]--------------------------------------------------------------------------
  Future<void> _onAuthSignIn(OnAuthLogIn event, Emitter<AuthState> emit) async {
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
}
