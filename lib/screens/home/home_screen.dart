import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/screens/home/add_todo_screen.dart';
import 'package:todo_bloc/screens/home/cubit/todo_cubit.dart';
import 'package:todo_bloc/utils/colors.dart';
import 'package:todo_bloc/utils/navigation.dart';
import 'package:todo_bloc/utils/texts.dart';
import 'package:todo_bloc/widgets/loading_indicator.dart';

import '../../widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TodoCubit>().getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigation.go(screen: AddTodoScreen(), context: context),
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add_rounded, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return LoadingIndicator();
          }
          if (state is TodoLoaded) {
            return state.todos.isEmpty
                ? Center(
                    child: Text('No Todo', style: kTitleTextStyle),
                  )
                : Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          'Task Groups (${state.todos.length})',
                          style: kTitleTextStyle,
                        ),
                        ListView.builder(
                          itemBuilder: (_, i) => TodoCard(todo: state.todos[i]),
                          itemCount: state.todos.length,
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  );
          }

          return SizedBox();
        },
      ),
    );
  }
}
