import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_horizontal_list.dart';
import 'package:responsive_app/widgets/custom_sliver_listview.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomHorizontalList(),
        CustomSliverListview(),
      ],
    );
  }
}
