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
