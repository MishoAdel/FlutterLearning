import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/expenses_item_model.dart';
import 'package:responsive_dashboard/utils/app_images.dart';
import 'package:responsive_dashboard/widgets/expenses_item.dart';

class ExpensesRow extends StatefulWidget {
  const ExpensesRow({
    super.key,
  });

  @override
  State<ExpensesRow> createState() => _ExpensesRowState();
}

class _ExpensesRowState extends State<ExpensesRow> {
  final List<ExpensesItemModel> expensesList = const [
    ExpensesItemModel(
      title: 'Balance',
      subTitle: 'April 2022',
      money: '\$20.129',
      iconImg: Assets.imagesBalance,
    ),
    ExpensesItemModel(
      title: 'Income',
      subTitle: 'April 2022',
      money: '\$20.129',
      iconImg: Assets.imagesIncome,
    ),
    ExpensesItemModel(
      title: 'Expenses',
      subTitle: 'April 2022',
      money: '\$20.129',
      iconImg: Assets.imagesExpenses,
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: expensesList.asMap().entries.map(
        (e) {
          int index = e.key;
          var item = e.value;
          if (index == 1) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ExpensesItem(
                    expensesItemModel: item,
                    isActive: selectedIndex == index,
                  ),
                ),
              ),
            );
          } else {
            return Expanded(
                child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: ExpensesItem(
                expensesItemModel: item,
                isActive: selectedIndex == index,
              ),
            ));
          }
        },
      ).toList(),
    );
  }
}
