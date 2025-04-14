import 'package:flutter/material.dart';
import 'package:responsive_app/widgets/desktop_layout.dart';
import 'package:responsive_app/widgets/mobile_layout.dart';
import 'package:responsive_app/widgets/tablet_layout.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(builder: (context, constrains) {
        if (constrains.maxWidth < 600) {
          return const MobileLayout();
        } else if (constrains.maxWidth < 900) {
          return const TabletLayout();
        } else {
          return const DesktopLayout();
        }
      }),
    );
  }
}
