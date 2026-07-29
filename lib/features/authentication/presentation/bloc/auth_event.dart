abstract class AuthEvent {}

class LoginRequested extends AuthEvent {}

class SignupRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

class ForgotPasswordRequested extends AuthEvent {}

class ResetPasswordRequested extends AuthEvent {}

class VerifyEmailRequested extends AuthEvent {}

class CheckAuthStatusRequested extends AuthEvent {}
