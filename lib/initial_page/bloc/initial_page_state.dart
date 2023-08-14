part of 'initial_page_bloc.dart';

final class InitialPageState extends Equatable {
  @override
  List<Object> get props => [];
}

final class InitialPageInitial extends InitialPageState {}

final class InitialPageSuccess extends InitialPageState {
  final String username;
  final String email;

  InitialPageSuccess({
    required this.username,
    required this.email,
  });
  @override
  List<Object> get props => [username, email];
}

final class InitialPageFailure extends InitialPageState {
  final String errorMessage;

  InitialPageFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}

final class InitialPageStateUpdated extends InitialPageState {
  final String username;
  final String email;

  InitialPageStateUpdated({
    required this.username,
    required this.email,
  });

  @override
  List<Object> get props => [username, email];
}
