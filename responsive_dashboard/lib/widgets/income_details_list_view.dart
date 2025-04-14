import 'package:flutter/material.dart';
import 'package:responsive_dashboard/models/item_details_model.dart';
import 'package:responsive_dashboard/widgets/inome_details.dart';

class IncomeDetailsListView extends StatelessWidget {
  const IncomeDetailsListView({super.key});

  static const List<ItemDetailsModel> incomeDetials = [
    ItemDetailsModel(
        color: Color(0xff208BC7), title: 'Design Service', value: '40%'),
    ItemDetailsModel(
        color: Color(0xff4DB7F2), title: 'Design Product', value: '25%'),
    ItemDetailsModel(
        color: Color(0xff064060), title: 'Product Roiality', value: '20%'),
    ItemDetailsModel(color: Color(0xffE2DECD), title: 'Other', value: '22%'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: incomeDetials.length,
        itemBuilder: (context, index) => InomeDetails(
          itemDetailsModel: incomeDetials[index],
        ),
      ),
    );
  }
}
