part of 'mycourse_bloc.dart';

sealed class MycourseState extends Equatable {
  const MycourseState();
  
  @override
  List<Object> get props => [];
}

final class MycourseInitial extends MycourseState {}
