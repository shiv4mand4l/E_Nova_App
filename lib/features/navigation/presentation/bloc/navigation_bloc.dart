import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(currentIndex: 0)) {
    on<OnChangeNavigationIndex>(_onChangeNavigationIndex);
  }

  void _onChangeNavigationIndex(
    OnChangeNavigationIndex event,
    Emitter<NavigationState> emit,
  ) {}
}
