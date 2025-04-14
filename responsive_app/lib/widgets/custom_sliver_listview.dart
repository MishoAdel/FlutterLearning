import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_listview_item.dart';

class CustomSliverListview extends StatelessWidget {
  const CustomSliverListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return const CustomListviewItem();
      },
      itemCount: 15,
    );
  }
}
