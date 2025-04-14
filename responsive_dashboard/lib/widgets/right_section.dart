import 'package:flutter/material.dart';
import 'package:responsive_dashboard/widgets/custom_background.dart';
import 'package:responsive_dashboard/widgets/icome_section.dart';
import 'package:responsive_dashboard/widgets/my_card_section.dart';
import 'package:responsive_dashboard/widgets/transaction_history_section.dart';

class RightSection extends StatelessWidget {
  const RightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackground(
      padding: 24,
      child: CustomScrollView(
        slivers: [
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
          SliverToBoxAdapter(child: IcomeSection())
        ],
      ),
    );
  }
}
