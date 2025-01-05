import 'package:flutter/material.dart';

import '../../widgets/custom_textfield.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController des = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomTextField(hint: 'Title', controller: title),
            CustomTextField(hint: 'Description', controller: des),
            const Spacer(),
            TextButton(onPressed: () {}, child: Text('Add')),
          ],
        ),
      ),
    );
  }
}
