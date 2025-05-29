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
      home: const HomePage(),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.child, required this.drawer});

  final Widget child;
  final Widget drawer;

  @override
  State<MyDrawer> createState() => _MtDrawerState();
}

class _MtDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late AnimationController _xChildController;
  late Animation<double> _yChildRotationAnimation;

  late AnimationController _xDrawerController;
  late Animation<double> _yDrawerRotationAnimation;

  @override
  void initState() {
    _xChildController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 500));
    super.initState();
    _yChildRotationAnimation =
        Tween<double>(begin: 0, end: -pi / 2).animate(_xChildController);

    _xDrawerController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 500));
    _yDrawerRotationAnimation =
        Tween<double>(begin: pi / 2.7, end: 0).animate(_xDrawerController);
  }

  @override
  void dispose() {
    _xChildController.dispose();
    _xDrawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxDrag = screenWidth * 0.8;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _xChildController.value += details.delta.dx / maxDrag;
        _xDrawerController.value += details.delta.dx / maxDrag;
      },
      onHorizontalDragEnd: (details) {
        if (_xChildController.value < 0.5) {
          _xChildController.reverse();
          _xDrawerController.reverse();
        } else {
          _xChildController.forward();
          _xDrawerController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _xChildController,
          _xDrawerController,
        ]),
        builder: (context, child) => Stack(
          children: [
            Container(
              color: const Color(0xff1a1b26),
            ),
            Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(-screenWidth + _xDrawerController.value * maxDrag)
                  ..rotateY(_yDrawerRotationAnimation.value),
                child: widget.drawer),
            Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(_xChildController.value * maxDrag)
                  ..rotateY(_yChildRotationAnimation.value),
                child: widget.child),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDrawer(
        drawer: Material(
          child: Container(
            color: const Color(0xff24283b),
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 120, top: 80),
              itemCount: 20,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
            ),
          ),
        ),
        child: Scaffold(
          body: Container(
            color: const Color(0xff414868),
          ),
          appBar: AppBar(
            title: const Text('Drawer'),
            centerTitle: true,
          ),
        ));
  }
}
