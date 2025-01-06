part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object> get props => [todos];
}

final class TodoInitial extends TodoState {
  const TodoInitial({super.todos});
}

final class TodoLoading extends TodoState {
  const TodoLoading({required super.todos});
}

final class TodoLoaded extends TodoState {
  const TodoLoaded({required super.todos});
}

final class TodoError extends TodoState {
  final String message;
  const TodoError({
    required this.message,
    super.todos,
  });
  @override
  List<Object> get props => [message];
}
