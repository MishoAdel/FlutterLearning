import 'package:flutter/material.dart';
import 'package:responsive_app/models/drawer_item.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.drawerItem});

  final DrawerItem drawerItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItem.icon),
      title: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(drawerItem.title)),
    );
  }
}
