import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/data/models/task.dart';
import 'package:todo_bloc/data/models/todo.dart';
import 'package:todo_bloc/screens/home/cubit/todo_cubit.dart';
import 'package:todo_bloc/utils/colors.dart';
import 'package:todo_bloc/widgets/custom_textfield.dart';

import '../../utils/texts.dart';
import '../../widgets/task_card.dart';

class TodoDetailsScreen extends StatelessWidget {
  final String todoId;
  const TodoDetailsScreen({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    TextEditingController task = TextEditingController();
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        Todo todo = state.todos.firstWhere((e) => e.id == todoId);
        return Scaffold(
          appBar: AppBar(
            title: Text(todo.title),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              spacing: 12,
              children: [
                CustomTextField(hint: 'New Task', controller: task),
                Expanded(
                  child: todo.tasks.isEmpty
                      ? Center(
                          child: Text('No Tasks', style: kTitleTextStyle),
                        )
                      : ListView.builder(
                          itemBuilder: (_, i) =>
                              TaskCard(task: todo.tasks[i], todoId: todoId),
                          itemCount: todo.tasks.length,
                          shrinkWrap: true,
                        ),
                ),
                TextButton(
                  onPressed: () {
                    if (task.text.isNotEmpty) {
                      context
                          .read<TodoCubit>()
                          .addTask(todoId, task.text.trim(), context);
                      task.clear();
                    }
                  },
                  child: Text('Add Task'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
