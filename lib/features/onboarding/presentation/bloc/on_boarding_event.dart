import 'package:equatable/equatable.dart';

abstract class OnBoardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// This is for PageChange Index
class PageChangedEvent extends OnBoardingEvent {
  final int index;

  PageChangedEvent(this.index);
}

// This is for Skip Button to Skip and go direct to last index
class SkipBtnEvent extends OnBoardingEvent {}

class ResetSkipBtnEvent extends OnBoardingEvent {}

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// This is for When the user is first time in app the the user have to show OnBoarding Screen and If! then the user directly goes on Login Screen

// Runs immediately when the app starts
class CheckAppStatus extends OnBoardingEvent {}
