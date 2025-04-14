import 'package:bookly_app/core/errors/faliure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpelement extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpelement(this.apiService);

  @override
  Future<Either<Faliure, List<BookModel>>> fetchbestSellerBookss() async {
    try {
      var data = await apiService.get(
          endPoints:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchfeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoints: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchRelatedBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoints:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioException(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
