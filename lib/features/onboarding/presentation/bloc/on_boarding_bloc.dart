import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_event.dart';
import 'package:e_nova/features/onboarding/presentation/bloc/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingState()) {
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
}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// This is for When the user is first time in app the the user have to show OnBoarding Screen and If! then the user directly goes on Login Screen
// class AppBloc extends Bloc<OnBoardingBloc, OnBoardingEvent> {

// }
