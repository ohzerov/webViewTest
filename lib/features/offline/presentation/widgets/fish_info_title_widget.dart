import 'package:flutter/material.dart';
import 'package:zmtest/features/offline/data/fish_info_data.dart';

class FishInfoTitle extends StatelessWidget {
  const FishInfoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 19,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fishInfo['name']!,
          style: TextStyle(
              fontFamily: 'Museo',
              fontSize: 32,
              color: Colors.white,
              height: 0.5),
        ),
        Text(
          fishInfo['desc']!,
          style: TextStyle(
              fontFamily: 'Murecho',
              fontSize: 16,
              color: const Color.fromARGB(175, 255, 255, 255)),
        ),
      ],
    );
  }
}
