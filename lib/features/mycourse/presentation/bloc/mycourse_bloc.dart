import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mycourse_event.dart';
part 'mycourse_state.dart';

class MycourseBloc extends Bloc<MycourseEvent, MycourseState> {
  MycourseBloc() : super(MycourseInitial()) {
    on<MycourseEvent>((event, emit) {});
  }
}
