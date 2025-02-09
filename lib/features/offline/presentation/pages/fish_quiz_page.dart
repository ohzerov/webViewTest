import 'package:flutter/material.dart';
import 'package:zmtest/features/offline/presentation/widgets/back_button_widget.dart';
import 'package:zmtest/features/offline/presentation/widgets/quiz_answers_widget.dart';

import 'package:zmtest/features/offline/presentation/widgets/quiz_question_widget.dart';

class FishQuizPage extends StatelessWidget {
  const FishQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              'assets/images/back.png',
            ),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  MediaQuery.sizeOf(context).height * (38 / 895),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    QuizQuestionWidget(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * (50 / 895),
                    ),
                    QuizAnswersWidget(),
                    Spacer()
                  ],
                ),
              ),
              Positioned(left: 32, child: BackButtonWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
