import 'package:flutter/material.dart';

void main() {
  runApp(BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0XFFD2BCD5),
        body: Center(
          child: Image(
            image: AssetImage("images/birthdayimg.png"),
          ),
        ),
      ),
    );
  }
}
