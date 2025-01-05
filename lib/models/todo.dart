import 'package:todo_bloc/models/task.dart';

class Todo {
  String id;
  String title;
  String description;
  List<Task> tasks;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.tasks = const [],
  });
}
