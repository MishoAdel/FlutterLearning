import 'package:flutter/material.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';

class AllExpensesHeader extends StatelessWidget {
  const AllExpensesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'All Expenses',
          style: AppStyles.styleSemiBold20(context),
        ),
        const Expanded(child: SizedBox()),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: const Color(0xffF1F1F1),
              )),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  'Monthly',
                  style: AppStyles.styleMedium16(context),
                ),
                const SizedBox(
                  width: 18,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff064061),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
