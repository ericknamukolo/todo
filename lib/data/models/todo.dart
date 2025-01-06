import 'package:todo_bloc/data/models/task.dart';

class Todo {
  String id;
  String title;

  List<Task> tasks;

  Todo({
    required this.id,
    required this.title,
    this.tasks = const [],
  });

  Todo copyWith({
    String? id,
    String? title,
    List<Task>? tasks,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      tasks: tasks ?? this.tasks,
    );
  }
}
