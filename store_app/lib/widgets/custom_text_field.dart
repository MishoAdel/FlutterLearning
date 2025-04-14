import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, this.onChangedFunc, required this.myHintText});

  Function(String)? onChangedFunc;
  String myHintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        onChanged: onChangedFunc,
        decoration: InputDecoration(
          hintText: myHintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
