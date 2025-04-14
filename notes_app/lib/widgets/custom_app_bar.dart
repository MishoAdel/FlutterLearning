import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.titleText,
      required this.endIcon,
      this.onPressed});
  final Icon endIcon;
  final String titleText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        const Spacer(),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(onPressed: onPressed, icon: endIcon),
        ),
      ],
    );
  }
}
