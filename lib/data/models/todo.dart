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
}
