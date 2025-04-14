import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data_lists/news_list.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/new_service.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key, required this.categoryType});

  final String categoryType;

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var myFuture;
  @override
  void initState() {
    super.initState();
    myFuture = NewsService(Dio()).getNews(category: widget.categoryType);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
        future: myFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListState(
              news: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text("There was an error, please try again later"),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
