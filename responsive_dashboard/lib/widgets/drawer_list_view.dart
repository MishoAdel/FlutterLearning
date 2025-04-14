import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/drawer_item_model.dart';
import 'package:responsive_dashboard/utils/app_images.dart';
import 'package:responsive_dashboard/widgets/drawer_item.dart';

class DrawerListView extends StatefulWidget {
  const DrawerListView({
    super.key,
  });

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  int activeIndex = 0;

  final List<DrawerItemModel> drawerList = [
    DrawerItemModel(title: 'Dashboard', icon: Assets.imagesDashboard),
    DrawerItemModel(title: 'My Transactions', icon: Assets.imagesMyTransctions),
    DrawerItemModel(title: 'Statistics', icon: Assets.imagesStatistics),
    DrawerItemModel(title: 'Wallet Account', icon: Assets.imagesWalletAccount),
    DrawerItemModel(title: 'My Investmnets', icon: Assets.imagesMyInvestments),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: drawerList.length,
      itemBuilder: (context, index) => GestureDetector(
        child: GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              activeIndex = index;
              setState(() {});
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: DrawerItem(
              drawerItemModel: drawerList[index],
              isActive: activeIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
