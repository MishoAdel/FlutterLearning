import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/user_info_model.dart';
import 'package:responsive_dashboard/utils/app_images.dart';
import 'package:responsive_dashboard/widgets/user_info_listtile.dart';

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({super.key});

  static List<UserInfoModel> transactionList = [
    UserInfoModel(
        icon: Assets.imagesAvatar1,
        title: 'Madarnia Andy',
        subTitle: 'Madraniadi20@gmail'),
    UserInfoModel(
        icon: Assets.imagesAvatar2,
        title: 'Josua Nunito',
        subTitle: 'Josh Nunito@gmail.com'),
    UserInfoModel(
        icon: Assets.imagesAvatar3,
        title: 'Madarnia Andy',
        subTitle: 'Madraniadi20@gmail'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: transactionList
            .map((e) =>
                IntrinsicWidth(child: UserInfoListtile(transationModel: e)))
            .toList(),
      ),
    );
  }
}
