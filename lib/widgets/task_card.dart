import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/data/models/task.dart';
import 'package:todo_bloc/screens/home/cubit/todo_cubit.dart';
import 'package:todo_bloc/utils/texts.dart';

import '../utils/colors.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final String todoId;
  const TaskCard({
    super.key,
    required this.task,
    required this.todoId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () =>
                context.read<TodoCubit>().toggleCompletion(todoId, task.id),
            child: Icon(
              task.complete
                  ? Icons.check_circle_rounded
                  : Icons.check_circle_outline_outlined,
              color: task.complete ? kPrimaryColor : Colors.grey[300],
              size: 28,
            ),
          ),
          SizedBox(width: 10),
          Text(task.title,
              style: kBodyTextStyle.copyWith(
                decoration: task.complete ? TextDecoration.lineThrough : null,
              )),
          const Spacer(),
          GestureDetector(
            onTap: () => context.read<TodoCubit>().deleteTask(todoId, task.id),
            child: Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
