import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/models/transaction_model.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';
import 'package:responsive_dashboard/widgets/transaction_list_tile.dart';

class TransactionHistorySection extends StatelessWidget {
  const TransactionHistorySection({super.key});

  static const List<TransactionModel> transactionList = [
    TransactionModel(
        isDeposit: false,
        title: 'Cash Withdrawal',
        date: '13 Apr, 2022 ',
        money: '\$20,129'),
    TransactionModel(
        isDeposit: true,
        title: 'Landing Page project',
        date: '13 Apr, 2022 at 3:30 PM ',
        money: '\$2000'),
    TransactionModel(
        isDeposit: true,
        title: 'Juni Mobile App project',
        date: '13 Apr, 2022 at 3:30 PM ',
        money: '\$20,129'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaction History',
              style: AppStyles.styleSemiBold20(context),
            ),
            Text(
              'See All',
              style:
                  AppStyles.styleMedium16(context).copyWith(color: kMainColor),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '13 April 2022',
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xFFAAAAAA)),
        ),
        ListView.builder(
          itemCount: transactionList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              TransactionListTile(transactionModel: transactionList[index]),
        )
      ],
    );
  }
}
