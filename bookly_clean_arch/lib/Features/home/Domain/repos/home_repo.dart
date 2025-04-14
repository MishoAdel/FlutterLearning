import 'package:bookly/Features/home/Domain/entities/book_entity.dart';
import 'package:bookly/core/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<BookEntity>>> fetchfeaturedBooks();
  Future<Either<Faliure, List<BookEntity>>> fetchbestSellerBookss();
  Future<Either<Faliure, List<BookEntity>>> fetchRelatedBooks(
      {required String category});
}
