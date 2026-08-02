import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:e_nova/features/splash/domain/repositories/splash_repository.dart';
import 'package:e_nova/features/splash/domain/usecases/check_app_status_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAppStatusUsecase _checkAppStatusUseCase;
  SplashBloc(this._checkAppStatusUseCase) : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }
  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());

    final status = await _checkAppStatusUseCase();
    emit(SplashNavigate(status));
  }
}
