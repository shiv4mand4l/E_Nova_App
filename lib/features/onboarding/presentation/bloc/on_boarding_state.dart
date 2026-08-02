import 'package:equatable/equatable.dart';

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
