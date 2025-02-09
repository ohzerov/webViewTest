import 'package:flutter/material.dart';
import 'package:zmtest/features/offline/presentation/widgets/back_button_widget.dart';

import 'package:zmtest/features/offline/presentation/widgets/fish_details_widget.dart';
import 'package:zmtest/features/offline/presentation/widgets/fish_info_title_widget.dart';

class FishInfoPage extends StatefulWidget {
  const FishInfoPage({super.key});

  @override
  State<FishInfoPage> createState() => _FishInfoPageState();
}

class _FishInfoPageState extends State<FishInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/salmon_back.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * (30 / 414),
              right: MediaQuery.sizeOf(context).width * (30 / 414),
              top: 0,
              bottom: MediaQuery.sizeOf(context).height * (98 / 895),
            ),
            child: Stack(
              children: [
                Column(
                  spacing: 19,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    FishInfoTitle(),
                    FishDetailsWidget(),
                  ],
                ),
                Positioned(
                  child: BackButtonWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
