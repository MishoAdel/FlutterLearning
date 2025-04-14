import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_sliver_grid.dart';
import 'package:responsive_app/widgets/custom_sliver_listview.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverGrid(),
        CustomSliverListview(),
      ],
    );
  }
}
