import 'package:flutter/material.dart';
import 'package:healthtick/build_screen.dart';
import 'package:healthtick/constants.dart';

class PageViewCreate extends StatefulWidget {
  @override
  _PageViewCreateState createState() => _PageViewCreateState();
}

class _PageViewCreateState extends State<PageViewCreate> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildDotsRow(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                ReusableCard(
                  bottomText: 'LETS STOP I\'M FULL NOW',
                  mainText: 'Nom Nom :)',
                  subText:
                      'It\'s simple: eat slowly for ten minutes, rest for\n                five, then finish your meal',
                  onTimerFinished: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
                ReusableCard(
                  bottomText: 'LETS STOP I\'M FULL NOW',
                  mainText: 'Break Time',
                  subText:
                      'Take a five-minute break to check in on your level of fullness',
                  onTimerFinished: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
                ReusableCard(
                  bottomText: 'LETS STOP I\'M FULL NOW',
                  mainText: 'Finish your meal',
                  subText: 'You can eat until you feel full',
                  onTimerFinished: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDotsRow() {
    return Container(
      color: kBackgroudColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3, // Number of pages
          (index) => buildDot(index),
        ),
      ),
    );
  }

  Widget buildDot(int pageIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == pageIndex ? Colors.white : Colors.grey,
      ),
    );
  }
}
