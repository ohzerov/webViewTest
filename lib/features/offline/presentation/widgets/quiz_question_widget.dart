import 'package:flutter/material.dart';

class QuizQuestionWidget extends StatelessWidget {
  const QuizQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          'Quiz',
          style:
              TextStyle(fontFamily: 'Museo', fontSize: 36, color: Colors.white),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'What kind of fish migrates from the ocean to the rivers to spawn?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Murecho',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ],
    );
  }
}
