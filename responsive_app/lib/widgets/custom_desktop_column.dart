import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_grid_item.dart';
import 'package:responsive_app/widgets/custom_listview_item.dart';

class CustomDesktopColumn extends StatelessWidget {
  const CustomDesktopColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: CustomGridItem(),
          ),
          Expanded(
            child: CustomListviewItem(),
          )
        ],
      ),
    );
  }
}
