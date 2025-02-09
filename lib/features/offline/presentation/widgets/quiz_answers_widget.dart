import 'package:flutter/material.dart';
import 'package:zmtest/features/offline/presentation/widgets/quiz_item_widget.dart';

class QuizAnswersWidget extends StatelessWidget {
  const QuizAnswersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: MediaQuery.sizeOf(context).width * (27 / 414),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuizItemWidget(
                imgUrl: 'assets/images/walleye.png', title: 'Walleye'),
            QuizItemWidget(imgUrl: 'assets/images/pike.png', title: 'Pike'),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (32 / 895),
        ),
        Row(
          spacing: MediaQuery.sizeOf(context).width * (27 / 414),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuizItemWidget(imgUrl: 'assets/images/salmon.png', title: 'Salmon'),
            QuizItemWidget(imgUrl: 'assets/images/tuna.png', title: 'Tuna'),
          ],
        ),
      ],
    );
  }
}
