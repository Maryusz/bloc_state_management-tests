import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'initial_page_event.dart';
part 'initial_page_state.dart';

class InitialPageBloc extends Bloc<InitialPageEvent, InitialPageState> {
  InitialPageBloc() : super(InitialPageInitial()) {
    on<InitialPageEvent>((event, emit) {
      if (event is InitialPageInit) {
        emit(InitialPageSuccess(
          username: event.username,
          email: event.email,
        ));
      }

      if (event is UpdateInitialPageState) {
        emit(InitialPageStateUpdated(
          username: event.username,
          email: event.email,
        ));
      }
    });
  }
}
