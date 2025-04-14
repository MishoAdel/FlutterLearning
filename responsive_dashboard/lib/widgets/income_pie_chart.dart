import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/widgets/income_details_list_view.dart';

class IncomePieChart extends StatefulWidget {
  const IncomePieChart({
    super.key,
  });

  @override
  State<IncomePieChart> createState() => _IncomePieChartState();
}

class _IncomePieChartState extends State<IncomePieChart> {
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 0.15 * MediaQuery.of(context).size.width,
          width: 0.15 * MediaQuery.of(context).size.width,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                enabled: true,
                touchCallback: (p0, pieTouchResponse1) {
                  activeIndex =
                      pieTouchResponse1?.touchedSection?.touchedSectionIndex ??
                          -1;
                  setState(() {});
                },
              ),
              sectionsSpace: 0,
              sections: [
                PieChartSectionData(
                  radius: activeIndex == 0 ? 60 : 50,
                  showTitle: false,
                  value: 40,
                  color: const Color(0xff208BC7),
                ),
                PieChartSectionData(
                  radius: activeIndex == 1 ? 60 : 50,
                  showTitle: false,
                  value: 25,
                  color: const Color(0xff4DB7F2),
                ),
                PieChartSectionData(
                  radius: activeIndex == 2 ? 60 : 50,
                  showTitle: false,
                  value: 20,
                  color: const Color(0xff064060),
                ),
                PieChartSectionData(
                  radius: activeIndex == 3 ? 60 : 50,
                  showTitle: false,
                  value: 22,
                  color: const Color(0xffE2DECD),
                ),
              ],
            ),
          ),
        ),
        const IncomeDetailsListView()
      ],
    );
  }
}
