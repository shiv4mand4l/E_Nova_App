// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_nova/features/onboarding/domain/usecases/check_auth_status_usecase.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_event.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final CheckAuthStatusUsecase checkAuthStatusUsecase;
  OnBoardingBloc(this.checkAuthStatusUsecase) : super(OnBoardingState()) {
    on<PageChangedEvent>(_pageChanged);
    on<SkipBtnEvent>(_skipBtn);
    on<ResetSkipBtnEvent>(_resetSkipBtn);
    on<CheckAppStatus>(_checkStatus);
  }

  // This is for PageChanged Netx or GetStarted Button

  void _pageChanged(PageChangedEvent event, Emitter<OnBoardingState> emit) {
    emit(
      state.copyWith(
        isLastPage: event.index == 2,
        btnName: event.index == 2 ? 'Get Started' : 'Next',
      ),
    );
  }

  // This is for Skip Button

  void _skipBtn(SkipBtnEvent event, Emitter<OnBoardingState> emit) {
    emit(state.copyWith(skip: true));
  }
  // This is for Reset Skip Button

  void _resetSkipBtn(ResetSkipBtnEvent event, Emitter<OnBoardingState> emit) {
    emit(state.copyWith(skip: false));
  }

  // ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  // This is for When the user is first time in app the the user have to show OnBoarding Screen and If! then the user directly goes on Login Screen
  // class AppBloc extends Bloc<OnBoardingBloc, OnBoardingEvent> {

  Future<void> _checkStatus(
    CheckAppStatus event,
    Emitter<OnBoardingState> emit,
  ) async {
    emit(OnboardingLoading());

    final result = await checkAuthStatusUsecase();

    if (!result.$1) {
      emit(GotoOnboarding());
    } else if (!result.$2) {
      emit(GotoLogin());
    } else {
      emit(GotoHome());
    }
  }
}
