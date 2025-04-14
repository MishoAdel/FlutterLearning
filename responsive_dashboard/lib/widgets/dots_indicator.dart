import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomDot(
          isActive: currentIndex == 0,
        ),
        CustomDot(
          isActive: currentIndex == 1,
        ),
        CustomDot(
          isActive: currentIndex == 2,
        )
      ],
    );
  }
}

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isActive ? 32 : 8,
        height: 8,
        decoration: ShapeDecoration(
            color: isActive ? kMainColor : const Color(0xFFE7E7E7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
