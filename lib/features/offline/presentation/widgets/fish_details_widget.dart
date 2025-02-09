import 'package:flutter/material.dart';
import 'package:zmtest/features/offline/data/fish_info_data.dart';

class FishDetailsWidget extends StatefulWidget {
  const FishDetailsWidget({super.key});

  @override
  State<FishDetailsWidget> createState() => _FishDetailsWidgetState();
}

class _FishDetailsWidgetState extends State<FishDetailsWidget> {
  PageController pageController = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * (245 / 895),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(22, 55, 133, 153),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      spacing: 14,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              duration: Duration(milliseconds: 100),
                              0,
                              curve: Curves.ease,
                            );
                          },
                          child: IntrinsicWidth(
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Benefits',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.zero,
                                  height: 2,
                                  color: _currentPage == 0
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              duration: Duration(milliseconds: 100),
                              1,
                              curve: Curves.ease,
                            );
                          },
                          child: IntrinsicWidth(
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Reproduction',
                                  style: TextStyle(
                                    fontFamily: 'Museo',
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.zero,
                                    height: 2,
                                    color: _currentPage == 1
                                        ? Colors.white
                                        : Colors.transparent),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    controller: pageController,
                    children: [
                      PageViewPage(
                        title: fishInfo['benefitTitle']!,
                        desc: fishInfo['benefitText']!,
                      ),
                      PageViewPage(
                          title: fishInfo['reproTitle']!,
                          desc: fishInfo['reproText']!),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              top: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor:
                            _currentPage == 0 ? Colors.white : Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor:
                            _currentPage == 1 ? Colors.white : Colors.grey,
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    spacing: 4,
                    children: [
                      GestureDetector(
                        onTap: _currentPage == 0
                            ? null
                            : () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF26495B),
                          ),
                          child: Transform.flip(
                            flipX: true,
                            child: Icon(
                              color: Colors.white,
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _currentPage == 1
                            ? null
                            : () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF26495B),
                          ),
                          child: Center(
                            child: Icon(
                              color: Colors.white,
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewPage extends StatelessWidget {
  final String title;
  final String desc;

  const PageViewPage({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 6,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Museo', fontSize: 18, color: Colors.white),
          ),
          Text(
            desc,
            style: TextStyle(
                fontFamily: 'Murecho',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
