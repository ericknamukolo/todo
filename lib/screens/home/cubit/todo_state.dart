part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object> get props => [todos];
}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoLoaded extends TodoState {}

final class TodoError extends TodoState {
  final String message;
  const TodoError({required this.message});
  @override
  List<Object> get props => [message];
}
