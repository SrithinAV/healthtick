import 'package:flutter/material.dart';
import 'package:healthtick/constants.dart';
import 'package:healthtick/create_menu.dart';

import 'build_screen.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Mindful Meal timer',
          style: TextStyle(
            fontSize: 24.00,
            color: Colors.white60,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: kBackgroudColor,
        elevation: 0.00,
      ),
      backgroundColor: kBackgroudColor,
      body: PageViewCreate(),
    );
  }
}
