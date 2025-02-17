import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_bloc/data/models/task.dart';
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
      List<Todo> newTodos = [...state.todos, todo];

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

  void addTask(String id, String title, context) {
    FocusScope.of(context).unfocus();
    Task newTask = Task(id: DateTime.now().toIso8601String(), title: title);

    //Fake request
    List<Todo> oldTodos = [...state.todos];
    final taskIndex = oldTodos.indexWhere((e) => e.id == id);
    final newtasks = [...oldTodos[taskIndex].tasks, newTask];
    oldTodos[taskIndex] = oldTodos[taskIndex].copyWith(tasks: newtasks);

    emit(TodoLoaded(todos: oldTodos));
  }

  void deleteTask(String todoId, String taskId) {
    List<Todo> oldTodos = [...state.todos];

    final taskIndex = oldTodos.indexWhere((e) => e.id == todoId);

    final newtasks = [...oldTodos[taskIndex].tasks];
    newtasks.removeWhere((e) => e.id == taskId);

    oldTodos[taskIndex] = oldTodos[taskIndex].copyWith(tasks: newtasks);

    emit(TodoLoaded(todos: oldTodos));
  }

  void deleteTodo(String todoId, context) {
    List<Todo> oldTodos = [...state.todos];
    oldTodos.removeWhere((e) => e.id == todoId);
    Navigator.of(context).pop();
    emit(TodoLoaded(todos: oldTodos));
  }

  void toggleCompletion(String todoId, String taskId) {
    try {
      List<Todo> oldTodos = [...state.todos];
      final todoIndex = oldTodos.indexWhere((e) => e.id == todoId);
      final taskIndex =
          oldTodos[todoIndex].tasks.indexWhere((e) => e.id == taskId);

      final currentStatus = oldTodos[todoIndex].tasks[taskIndex].complete;

      final updatedTasks = [...oldTodos[todoIndex].tasks];

      updatedTasks[taskIndex] =
          updatedTasks[taskIndex].copyWith(complete: !currentStatus);

      oldTodos[todoIndex] = oldTodos[todoIndex].copyWith(tasks: updatedTasks);

      emit(TodoLoaded(todos: oldTodos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }

  String getCompletion(String todoId) {
    List<Task> tasks = state.todos.firstWhere((e) => e.id == todoId).tasks;
    int completedTasks = tasks.where((e) => e.complete).length;
    if (tasks.isEmpty) return '0.0';
    return ((completedTasks / tasks.length) * 100).toStringAsFixed(1);
  }
}
