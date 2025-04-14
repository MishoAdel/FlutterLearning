import 'package:flutter/material.dart';
import 'package:responsive_dashboard/widgets/custom_drawer.dart';
import 'package:responsive_dashboard/widgets/main_section.dart';
import 'package:responsive_dashboard/widgets/right_section.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 2, child: CustomDrawer()),
        SizedBox(
          width: 32,
        ),
        Expanded(flex: 4, child: MainSection()),
        SizedBox(
          width: 24,
        ),
        Expanded(flex: 3, child: RightSection())
      ],
    );
  }
}
