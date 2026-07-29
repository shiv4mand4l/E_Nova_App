// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// ignore: duplicate_ignore
// ignore: must_be_immutable
class OnBoardingState extends Equatable {
  String? btnName;
  bool? skip;
  bool? isLastPage;

  OnBoardingState({this.btnName, this.skip = false, this.isLastPage = false});

  // This is for First Initilization of Skip, Button , and Last page
  OnBoardingState copyWith({
    String? btnName = 'Next',
    bool? skip,
    bool? isLastPage,
  }) {
    return OnBoardingState(
      btnName: btnName ?? this.btnName,
      skip: skip ?? false,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props => [btnName, skip, isLastPage];
}

// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// This is for When the user is first time in app the the user have to show OnBoarding Screen and If! then the user directly goes on Login Screen
class AppInitial extends OnBoardingState {}

// The app is checking local storage for the flag
class AppCheckingStatus extends OnBoardingState {}

// First time user -> Show Onboarding
class AppOnboardingRequired extends OnBoardingState {}

// Not first time -> Show Login
class AppLoginRequired extends OnBoardingState {}
