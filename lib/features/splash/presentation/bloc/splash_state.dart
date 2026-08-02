part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashNavigate extends SplashState {
  final AppStartStatus status;

  const SplashNavigate(this.status);

  @override
  List<Object> get props => [status];
}
