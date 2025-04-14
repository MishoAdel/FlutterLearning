import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/custom_grid_item.dart';

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 16),
              child: AspectRatio(aspectRatio: 1, child: CustomGridItem()),
            );
          },
        ),
      ),
    );
  }
}
