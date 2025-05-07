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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const defaultWidth = 100.0;

class _HomePageState extends State<HomePage> {
  bool _isZoomedin = false;
  String _buttonTitle = 'Zoom In';

  double _width = defaultWidth;

  Curve _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: const Color.fromARGB(255, 59, 59, 59),
          centerTitle: true,
          title: const Text('People'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                    duration: const Duration(microseconds: 3000),
                    curve: _curve,
                    width: _width,
                    child: Image.asset(
                      'assets/images/133556744614269501.jpg',
                    )),
              ],
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _isZoomedin = !_isZoomedin;
                    _buttonTitle = _isZoomedin ? 'Zoom Out' : 'Zoom In';
                    _width = _isZoomedin
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;
                    _curve =
                        _isZoomedin ? Curves.bounceInOut : Curves.bounceOut;
                  });
                },
                child: Text(_buttonTitle))
          ],
        ));
  }
}
