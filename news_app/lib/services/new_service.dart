import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  Future<List<NewsModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=eg&apiKey=724f5150c80f49f4a03e524ad6cee9e3&category=$category");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<NewsModel> newsModel = [];

      for (var myarticle in articles) {
        NewsModel myModel = NewsModel(
          imgLink: myarticle['urlToImage'],
          headTitle: myarticle['title'],
          describtion: myarticle['description'],
        );
        newsModel.add(myModel);
      }
      return newsModel;
    } catch (e) {
      return [];
    }
  }
}
