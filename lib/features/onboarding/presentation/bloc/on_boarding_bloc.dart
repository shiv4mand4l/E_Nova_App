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
}
