import 'package:flutter/cupertino.dart';

class Navigation {
  static void go(
      {required Widget screen,
      required BuildContext context,
      bool replace = false}) {
    if (replace) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (_) => screen));
    } else {
      Navigator.of(context).push(CupertinoPageRoute(builder: (_) => screen));
    }
  }
}
