// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zmtest/features/offline/presentation/pages/fish_info_page.dart';
import 'package:zmtest/features/offline/presentation/pages/fish_quiz_page.dart';
import 'package:zmtest/features/offline/presentation/widgets/menu_item_widget.dart';

class FishHomePage extends StatefulWidget {
  const FishHomePage({super.key});

  @override
  State<FishHomePage> createState() => _FishHomePageState();
}

class _FishHomePageState extends State<FishHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/menu.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * (190 / 895),
            left: 30,
            child: Column(
              spacing: MediaQuery.sizeOf(context).height * (85 / 895),
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuItem(
                    title: 'Fish Info',
                    description:
                        'Immerse yourself in the amazing\nunderwater world',
                    buttonText: 'Read',
                    onPressed: () async {
                      await precacheImage(
                          AssetImage('salmon_back.png'), context);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FishInfoPage()));
                    }),
                MenuItem(
                    title: 'Fish Quiz',
                    description:
                        'Immerse yourself in the amazing\nunderwater world',
                    buttonText: 'Play',
                    onPressed: () async {
                      await precacheImage(AssetImage('back.png'), context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FishQuizPage()));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
