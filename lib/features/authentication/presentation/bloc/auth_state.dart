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

final class Auth extends AuthState {}

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

final class AuthTermsChanged extends AuthState {
  final bool isAccepted;

  const AuthTermsChanged(this.isAccepted);

  @override
  List<Object> get props => [isAccepted];
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// import 'package:equatable/equatable.dart';

// class AuthState extends Equatable {
//   final bool isLoading;
//   final bool isTermsAccepted;
//   final String? user;
//   final String? errorMessage;

//   const AuthState({
//     this.isLoading = false,
//     this.isTermsAccepted = false,
//     this.user,
//     this.errorMessage,
//   });

//   AuthState copyWith({
//     bool? isLoading,
//     bool? isTermsAccepted,
//     String? user,
//     String? errorMessage,
//   }) {
//     return AuthState(
//       isLoading: isLoading ?? this.isLoading,
//       isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
//       user: user ?? this.user,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }

//   @override
//   List<Object?> get props => [isLoading, isTermsAccepted, user, errorMessage];
// }
