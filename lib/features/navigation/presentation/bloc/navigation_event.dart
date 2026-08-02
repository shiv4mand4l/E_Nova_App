part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

final class OnChangeNavigationIndex extends NavigationEvent {
  final int index;

  const OnChangeNavigationIndex({required this.index});

  @override
  List<Object> get props => [index];
}
