part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class OnTermsAcceptedChanged extends AuthEvent {
  final bool isAccepted;

  const OnTermsAcceptedChanged(this.isAccepted);

  @override
  List<Object> get props => [isAccepted];
}

final class OnAuthSignUp extends AuthEvent {
  final SignUpParams signUpParams;

  const OnAuthSignUp(this.signUpParams);
}

final class OnAuthLogIn extends AuthEvent {
  final LogInParams logInParams;

  const OnAuthLogIn(this.logInParams);
}
