import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'second_page_event.dart';
part 'second_page_state.dart';

class SecondPageBloc extends Bloc<SecondPageEvent, SecondPageState> {
  SecondPageBloc() : super(SecondPageInitial()) {
    on<SecondPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
