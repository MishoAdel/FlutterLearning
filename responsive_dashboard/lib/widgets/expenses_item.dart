import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/expenses_item_model.dart';
import 'package:responsive_dashboard/widgets/active_expenses_item.dart';
import 'package:responsive_dashboard/widgets/inactive_expenses_item.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({
    super.key,
    required this.expensesItemModel,
    required this.isActive,
  });

  final ExpensesItemModel expensesItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveExpensesItem(expensesItemModel: expensesItemModel)
        : InActiveExpensesItem(expensesItemModel: expensesItemModel);
  }
}
