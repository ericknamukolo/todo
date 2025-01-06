import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
        strokeWidth: 1.5,
      ),
    );
  }
}
