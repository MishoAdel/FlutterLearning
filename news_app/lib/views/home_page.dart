import 'package:flutter/material.dart';
import 'package:news_app/data_lists/category_data.dart';
import 'package:news_app/data_lists/news_list_builder.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
              text: const TextSpan(
                  text: "News",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                TextSpan(text: "Cloud", style: TextStyle(color: Colors.orange))
              ])),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 85, child: CategoryList()),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22,
              ),
            ),
            NewsListBuilder(
              categoryType: "general",
            ),
          ],
        ),
      ),
    );
  }
}
