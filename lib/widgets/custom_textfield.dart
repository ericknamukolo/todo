import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  const CustomTextField({super.key, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        textCapitalization: TextCapitalization.words,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          hintFadeDuration: Duration(seconds: 1),
          hintText: hint,
        ),
      ),
    );
  }
}
