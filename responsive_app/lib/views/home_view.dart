import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_drawer.dart';
import 'package:responsive_app/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xffDBDBDB),
      appBar: MediaQuery.of(context).size.width - 32 < 900
          ? AppBar(
              leading: GestureDetector(
                onTap: () => {scafoldKey.currentState!.openDrawer()},
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.black,
            )
          : null,
      body: const HomeViewBody(),
    );
  }
}
