part of 'initial_page_bloc.dart';

sealed class InitialPageEvent extends Equatable {
  const InitialPageEvent();

  @override
  List<Object> get props => [];
}

class InitialPageInit extends InitialPageEvent {
  final String username;
  final String email;

  const InitialPageInit({
    required this.username,
    required this.email,
  });

  @override
  List<Object> get props => [username, email];
}

class UpdateInitialPageState extends InitialPageEvent {
  final String username;
  final String email;

  const UpdateInitialPageState({
    required this.username,
    required this.email,
  });

  @override
  List<Object> get props => [username, email];
}
