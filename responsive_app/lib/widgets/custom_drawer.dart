import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_app/models/drawer_item.dart';
import 'package:responsive_app/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  final List<DrawerItem> drawerList = const [
    DrawerItem(
      title: 'D A S H B O A R D',
      icon: Icons.home,
    ),
    DrawerItem(
      title: 'S E T T I N G',
      icon: Icons.settings,
    ),
    DrawerItem(
      title: 'A B O U T',
      icon: Icons.info,
    ),
    DrawerItem(
      title: 'L O G O U T',
      icon: Icons.logout,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffDBDBDB),
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(FontAwesomeIcons.solidHeart),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: drawerList.length,
            itemBuilder: (context, index) {
              return CustomDrawerItem(drawerItem: drawerList[index]);
            },
          )
        ],
      ),
    );
  }
}
