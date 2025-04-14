import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_dashboard/models/expenses_item_model.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';

class InActiveExpensesItem extends StatelessWidget {
  const InActiveExpensesItem({
    super.key,
    required this.expensesItemModel,
  });

  final ExpensesItemModel expensesItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: const Color(0xffF1F1F1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: const ShapeDecoration(
                      shape: OvalBorder(), color: Color(0xffF1F1F1)),
                  child: Center(
                      child: SvgPicture.asset(expensesItemModel.iconImg))),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          Text(
            expensesItemModel.title,
            style: AppStyles.styleBold16(context),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            expensesItemModel.subTitle,
            style: AppStyles.styleRegular14(context),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            expensesItemModel.money,
            style: AppStyles.styleSemiBold24(context),
          )
        ],
      ),
    );
  }
}
