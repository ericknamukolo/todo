import 'package:flutter/material.dart';
import 'package:todo_bloc/data/models/todo.dart';
import 'package:todo_bloc/screens/home/cubit/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/utils/texts.dart';
import 'package:todo_bloc/widgets/loading_indicator.dart';
import '../../widgets/custom_textfield.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
        centerTitle: true,
      ),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is TodoLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('Task Added successfully!', style: kBodyTextStyle)));
            Navigator.of(context).pop();
          }
          if (state is TodoError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message, style: kBodyTextStyle)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextField(hint: 'Title', controller: title),
                const Spacer(),
                if (state is TodoLoading)
                  LoadingIndicator()
                else
                  TextButton(
                    onPressed: () {
                      if (title.text.isNotEmpty) {
                        context.read<TodoCubit>().addTodo(
                              Todo(
                                id: DateTime.now().toIso8601String(),
                                title: title.text.trim(),
                              ),
                              context,
                            );
                      }
                    },
                    child: Text('Add'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
