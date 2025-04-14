import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({required this.buttonText, this.onTapFunc, super.key});

  VoidCallback? onTapFunc;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 40,
        width: 380,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onTapFunc,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
