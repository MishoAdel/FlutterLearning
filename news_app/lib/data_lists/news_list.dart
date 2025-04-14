import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/news_widget.dart';

class NewsListState extends StatelessWidget {
  final List<NewsModel> news;

  const NewsListState({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: news.length,
        (context, index) {
          return NewsWidget(
            newsModel: news[index],
          );
        },
      ),
    );
  }
}
