import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/drawer_item_model.dart';
import 'package:responsive_dashboard/models/user_info_model.dart';
import 'package:responsive_dashboard/utils/app_images.dart';
import 'package:responsive_dashboard/widgets/drawer_list_view.dart';
import 'package:responsive_dashboard/widgets/inactive_drawer_item.dart';
import 'package:responsive_dashboard/widgets/user_info_listtile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: UserInfoListtile(
              transationModel: UserInfoModel(
                icon: Assets.imagesAvatar3,
                title: 'Lekan Okeowo',
                subTitle: 'demo@gmail.com',
              ),
            ),
          ),
          const DrawerListView(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                InactivedrawerItem(
                  drawerItemModel: DrawerItemModel(
                      icon: Assets.imagesSettings, title: 'Setting system'),
                ),
                const SizedBox(
                  height: 20,
                ),
                InactivedrawerItem(
                  drawerItemModel: DrawerItemModel(
                      title: 'Logout account', icon: Assets.imagesLogout),
                ),
                const SizedBox(
                  height: 45,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
