import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_bloc/data/models/todo.dart';
import 'package:todo_bloc/data/repo/todo_repo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  void addTodo(Todo todo, context) async {
    try {
      FocusScope.of(context).unfocus();
      emit(TodoLoading(todos: state.todos));
      //Fake request
      await TodoRepo.createTodo();
      List<Todo> newTodos = [...state.todos];

      newTodos.add(todo);

      emit(TodoLoaded(todos: newTodos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  void getTodo() async {
    try {
      emit(TodoLoading(todos: state.todos));
      //Fake request
      await TodoRepo.getTodo();

      emit(TodoLoaded(todos: state.todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }
}
