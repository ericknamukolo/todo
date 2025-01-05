import 'package:flutter/material.dart';
import 'package:todo_bloc/utils/colors.dart';
import 'package:todo_bloc/utils/texts.dart';

import '../../widgets/todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimary,
        child: Icon(Icons.add_rounded, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              'Task Groups',
              style: kTitleTextStyle,
            ),
            TodoCard(),
          ],
        ),
      ),
    );
  }
}
