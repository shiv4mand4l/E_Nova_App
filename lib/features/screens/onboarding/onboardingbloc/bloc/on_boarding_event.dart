import 'package:equatable/equatable.dart';

abstract class OnBoardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PageChangedEvent extends OnBoardingEvent {
  final int index;

  PageChangedEvent(this.index);
}

class SkipBtnEvent extends OnBoardingEvent {}

class ResetSkipBtnEvent extends OnBoardingEvent {}
