import 'package:flutter/material.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.title, required this.hintText});

  final String title, hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleMedium16(context),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppStyles.styleRegular16(context)
                    .copyWith(color: const Color(0xFFAAAAAA)),
                fillColor: const Color(0xFFFAFAFA),
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder()),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFAFAFA)));
  }
}
