import 'package:flutter/material.dart';

void main() {
  runApp(BusinessCardApp());
}

class CircleImage extends StatelessWidget {
  const CircleImage({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 112,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/tharwat.png'),
        radius: 110,
      ),
    );
  }
}

class BusinessNameText extends StatelessWidget {
  const BusinessNameText({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Michael Adel",
      style:
          TextStyle(fontFamily: 'Pacifico', fontSize: 32, color: Colors.white),
    );
  }
}

class JobTitleText extends StatelessWidget {
  const JobTitleText({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("FLUTTER DEVELOPER",
        style: TextStyle(
          color: Color(0xFF6C8090),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ));
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFF6C8090),
      thickness: 1,
      indent: 60,
      endIndent: 60,
      height: 10,
    );
  }
}

class phoneNumberBox extends StatelessWidget {
  const phoneNumberBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 60,
        child: const Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 40),
              child: Icon(
                Icons.phone,
                size: 32,
                color: Color(0xFF2B475E),
              ),
            ),
            Text(
              '(+20) 1212345678',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}

class EmailBox extends StatelessWidget {
  const EmailBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 60,
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 40),
              child: Icon(
                Icons.mail,
                size: 32,
                color: Color(0xFF2B475E),
              ),
            ),
            Text(
              'myemail@gmail.com',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}

class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF2B475E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleImage(),
          BusinessNameText(),
          JobTitleText(),
          DividerLine(),
          phoneNumberBox(),
          EmailBox(),
        ],
      ),
    ));
  }
}
