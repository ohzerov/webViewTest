import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;
  const MenuItem({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.sizeOf(context).width * (36 / 414),
              fontFamily: 'Museo',
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (4 / 895),
        ),
        Text(
          description,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.sizeOf(context).width * (16 / 414),
              fontFamily: 'Murecho',
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (10 / 895),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).height * (95 / 895),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.sizeOf(context).width * (10 / 414),
                  fontFamily: 'Museo',
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
