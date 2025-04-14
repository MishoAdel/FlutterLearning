import 'package:flutter/material.dart';

class CustomListviewItem extends StatelessWidget {
  const CustomListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xffECECEC),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
