import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_text_filed.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFiled(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Results :',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 10,
          ),
          SearchResultListview(),
        ],
      ),
    );
  }
}
