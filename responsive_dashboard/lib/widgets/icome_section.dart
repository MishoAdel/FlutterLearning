import 'package:flutter/material.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';
import 'package:responsive_dashboard/widgets/income_pie_chart.dart';

class IcomeSection extends StatelessWidget {
  const IcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Income',
              style: AppStyles.styleSemiBold20(context),
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xffF1F1F1)),
                    borderRadius: BorderRadius.circular(12)),
              ),
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
            )
          ],
        ),
        const IncomePieChart()
      ],
    );
  }
}
