import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/data/models/todo.dart';
import 'package:todo_bloc/screens/home/todo_details_screen.dart';
import 'package:todo_bloc/utils/navigation.dart';

import '../screens/home/cubit/todo_cubit.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigation.go(
          screen: TodoDetailsScreen(todoId: todo.id), context: context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Colors.black.withOpacity(.05),
              offset: Offset(1.0, 0.1),
              spreadRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(Icons.notes_rounded, color: kPrimaryColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title, style: kBodyTitleTextStyle),
                Text(
                    '${todo.tasks.length} Tasks / ${context.read<TodoCubit>().getCompletion(todo.id)} %',
                    style: kBodyTextStyle),
              ],
            ),
            const Spacer(),
            CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              value: double.parse(
                      context.read<TodoCubit>().getCompletion(todo.id)) /
                  100,
              backgroundColor: kPrimaryColor.withOpacity(.1),
              color: double.parse(
                          context.read<TodoCubit>().getCompletion(todo.id)) ==
                      100.0
                  ? Colors.green
                  : kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
