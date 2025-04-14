import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/transaction_model.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({super.key, required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      color: const Color(0xFFFAFAFA),
      child: ListTile(
        title: Text(
          transactionModel.title,
          style: AppStyles.styleSemiBold16(context),
        ),
        subtitle: Text(transactionModel.date,
            style: AppStyles.styleRegular16(context)
                .copyWith(color: const Color(0xFFAAAAAA))),
        trailing: Text(
          transactionModel.money,
          style: AppStyles.styleSemiBold20(context).copyWith(
              color: transactionModel.isDeposit ? Colors.green : Colors.red),
        ),
      ),
    );
  }
}
