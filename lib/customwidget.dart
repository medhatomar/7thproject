import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff608BC1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Weather&Music',
              style: TextStyle(
                color: Color(0xffF3F3E0),
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
