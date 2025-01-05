import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/texts.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ]),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: kPrimary.withOpacity(.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(Icons.notes_rounded, color: kPrimary),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Office Project', style: kBodyTitleTextStyle),
              Text('22 Tasks / 25%', style: kBodyTextStyle),
            ],
          ),
          const Spacer(),
          CircularProgressIndicator(
            strokeCap: StrokeCap.round,
            value: 0.8,
            backgroundColor: kPrimary.withOpacity(.1),
            color: kPrimary,
          ),
        ],
      ),
    );
  }
}
