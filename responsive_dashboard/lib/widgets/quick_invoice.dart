import 'package:flutter/material.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/utils/app_styles.dart';
import 'package:responsive_dashboard/widgets/custom_background.dart';
import 'package:responsive_dashboard/widgets/custom_button.dart';
import 'package:responsive_dashboard/widgets/custom_text_field.dart';
import 'package:responsive_dashboard/widgets/transactions_list_view.dart';

class QuickInvoice extends StatelessWidget {
  const QuickInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Invoice',
                style: AppStyles.styleSemiBold20(context),
              ),
              const Icon(
                Icons.add,
                color: kMainColor,
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Latest trasaction',
            style: AppStyles.styleMedium16(context),
          ),
          const SizedBox(
            height: 12,
          ),
          const TransactionsListView(),
          const Divider(
            height: 48,
          ),
          const Row(
            children: [
              CustomTextField(
                title: 'Customer Name',
                hintText: 'Type customer name',
              ),
              SizedBox(
                width: 16,
              ),
              CustomTextField(
                title: 'Customer Email',
                hintText: 'Type customer email',
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
            children: [
              CustomTextField(
                title: 'Item Name',
                hintText: 'Type item name',
              ),
              SizedBox(
                width: 16,
              ),
              CustomTextField(
                title: 'Item aount',
                hintText: 'Type item amount',
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Add more details',
                    style: AppStyles.styleSemiBold16(context)
                        .copyWith(color: kMainColor),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Expanded(child: CustomButton())
            ],
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}
