import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        height: MediaQuery.sizeOf(context).height * (45 / 895),
        width: MediaQuery.sizeOf(context).width * (45 / 414),
        child: Center(
          child: Image.asset(
            height: 18,
            'assets/images/house.png',
          ),
        ),
      ),
    );
  }
}
