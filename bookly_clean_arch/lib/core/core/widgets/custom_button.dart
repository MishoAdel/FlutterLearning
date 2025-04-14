import 'package:bookly/core/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      required this.buttonText});

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(12),
                )),
            onPressed: () {},
            child: Text(
              buttonText,
              style: Styles.textStyle16.copyWith(
                color: textColor,
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            )),
      ),
    );
  }
}
