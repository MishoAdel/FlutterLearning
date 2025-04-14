import 'package:flutter/material.dart';
import 'package:responsive_dashboard/widgets/all_expenses.dart';
import 'package:responsive_dashboard/widgets/icome_section.dart';
import 'package:responsive_dashboard/widgets/my_card_section.dart';
import 'package:responsive_dashboard/widgets/quick_invoice.dart';
import 'package:responsive_dashboard/widgets/transaction_history_section.dart';

class MainSectionMobile extends StatelessWidget {
  const MainSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AllExpenses()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(child: QuickInvoice()),
          SliverToBoxAdapter(
            child: SizedBox(
              width: 24,
            ),
          ),
          SliverToBoxAdapter(child: MyCardSection()),
          SliverToBoxAdapter(
            child: Divider(
              height: 40,
              color: Color(0xffF1F1F1),
            ),
          ),
          SliverToBoxAdapter(child: TransactionHistorySection()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(child: IcomeSection()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
