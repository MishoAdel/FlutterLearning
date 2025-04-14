import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard/models/user_info_model.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';

class UserInfoListtile extends StatelessWidget {
  const UserInfoListtile({
    super.key,
    required this.transationModel,
  });

  final UserInfoModel transationModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFAFAFA),
      elevation: 0,
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(transationModel.icon),
          title: Text(transationModel.title),
          titleTextStyle: AppStyles.styleSemiBold16(context),
          subtitle: Text(transationModel.subTitle),
          subtitleTextStyle: AppStyles.styleRegular12(context),
        ),
      ),
    );
  }
}
