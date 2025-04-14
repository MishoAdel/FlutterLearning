import 'package:flutter/material.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => const Text('  '),
        // BestSellerCard(),
        itemCount: 10,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
