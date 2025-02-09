import 'package:flutter/material.dart';

class QuizItemWidget extends StatelessWidget {
  const QuizItemWidget({super.key, required this.imgUrl, required this.title});
  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MediaQuery.sizeOf(context).height * (17 / 895),
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * (152 / 895),
          width: MediaQuery.sizeOf(context).width * (152 / 414),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: Image.asset(
            imgUrl,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Museo', fontSize: 18.5, color: Colors.white),
        ),
      ],
    );
  }
}
