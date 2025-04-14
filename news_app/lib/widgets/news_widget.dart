import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 400,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              newsModel.imgLink ??
                  "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=2048x2048&w=is&k=20&c=SiCdpoQwFnlm2PxkFkfhKzVOs6-9thLv0ucoREy_OWE=",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            newsModel.headTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            newsModel.describtion ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
