part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSuccess extends AuthState {
  final UserEntity userEntity;

  const AuthSuccess(this.userEntity);

  @override
  List<Object> get props => [userEntity];
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

// -----------------[For Term and Condition in Sign Up Page]-----------------------------------------------------------
final class AuthTermsChanged extends AuthState {
  final bool isAccepted;

  const AuthTermsChanged(this.isAccepted);

  @override
  List<Object> get props => [isAccepted];
}

// -----------------[For Obsecuring the Password]-----------------------------------------------------------

final class AuthIsPasswordObsecure extends AuthState {
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;

  const AuthIsPasswordObsecure({
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
  });

  @override
  List<Object> get props => [isPasswordObscure, isConfirmPasswordObscure];
}

// -----------------[For Obsecuring the Password]-----------------------------------------------------------
final class AuthForgotPassword extends AuthState {}
