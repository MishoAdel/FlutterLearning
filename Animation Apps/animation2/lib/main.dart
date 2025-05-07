import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: HomePage(),
    );
  }
}

enum CircleSide { left, rigt }

extension ToPath on CircleSide {
  Path topath(Size size) {
    final path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.rigt:
        // path.moveTo(0, size.width);
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise);

    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide circleSide;

  const HalfCircleClipper({super.reclip, required this.circleSide});
  @override
  Path getClip(Size size) => circleSide.topath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _rotationAnimation = Tween<double>(begin: 0, end: (-pi / 2.0)).animate(
        CurvedAnimation(parent: _rotationController, curve: Curves.bounceOut));
    _flipController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(
        CurvedAnimation(parent: _flipController, curve: Curves.bounceOut));
    super.initState();
    _rotationAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _flipAnimation = Tween<double>(
                  begin: _flipAnimation.value, end: _flipAnimation.value + pi)
              .animate(CurvedAnimation(
                  parent: _flipController, curve: Curves.bounceOut));
          _flipController
            ..reset()
            ..forward();
        }
      },
    );
    _flipAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _rotationAnimation = Tween<double>(
                  begin: _rotationAnimation.value,
                  end: _rotationAnimation.value + (-pi / 2.0))
              .animate(CurvedAnimation(
                  parent: _rotationController, curve: Curves.bounceOut));
          _rotationController
            ..reset()
            ..forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _rotationController
      ..reset()
      ..forward.delayed(const Duration(
        seconds: 1,
      ));

    return Scaffold(
      body: SafeArea(
          child: AnimatedBuilder(
        animation: _rotationController,
        builder: (context, child) => Transform(
          transform: Matrix4.identity()..rotateZ(_rotationAnimation.value),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) => Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                  child: ClipPath(
                    clipper:
                        const HalfCircleClipper(circleSide: CircleSide.left),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: const Color(0xff0057b7),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) => Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                  child: ClipPath(
                    clipper:
                        const HalfCircleClipper(circleSide: CircleSide.rigt),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: const Color(0xffffb700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
