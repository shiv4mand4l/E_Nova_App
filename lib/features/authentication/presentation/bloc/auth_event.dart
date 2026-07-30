part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// --------------------------[For Terms and Condition in Sign Up]---------------------------------------------------
final class OnTermsAcceptedChanged extends AuthEvent {
  final bool isAccepted;

  const OnTermsAcceptedChanged(this.isAccepted);

  @override
  List<Object> get props => [isAccepted];
}

// --------------------------[For Eye Icon Which will secure the pass or not]---------------------------------------------------
final class OnAuthPasswordObsecure extends AuthEvent {
  final bool isPasswordObsecure;

  const OnAuthPasswordObsecure(this.isPasswordObsecure);

  @override
  List<Object> get props => [isPasswordObsecure];
}

final class OnAuthConfirmPasswordObsecure extends AuthEvent {
  final bool isConfirmPasswordObsecure;

  const OnAuthConfirmPasswordObsecure(this.isConfirmPasswordObsecure);

  @override
  List<Object> get props => [isConfirmPasswordObsecure];
}

// --------------------------[For Sign Up]---------------------------------------------------
final class OnAuthSignUp extends AuthEvent {
  final SignUpParams signUpParams;

  const OnAuthSignUp(this.signUpParams);

  @override
  List<Object> get props => [signUpParams];
}

// --------------------------[For Log In]---------------------------------------------------
final class OnAuthLogIn extends AuthEvent {
  final LogInParams logInParams;

  const OnAuthLogIn(this.logInParams);

  @override
  List<Object> get props => [logInParams];
}

// --------------------------[For Forgot password]---------------------------------------------------
final class OnForgotPassword extends AuthEvent {
  final ForgotPasswordParams forgotPasswordParams;

  const OnForgotPassword(this.forgotPasswordParams);

  @override
  List<Object> get props => [forgotPasswordParams];
}
