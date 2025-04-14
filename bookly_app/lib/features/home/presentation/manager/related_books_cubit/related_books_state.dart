part of 'related_books_cubit.dart';

sealed class RelatedBooksState extends Equatable {
  const RelatedBooksState();

  @override
  List<Object> get props => [];
}

final class RelatedBooksInitial extends RelatedBooksState {}

final class RelatedBooksSucess extends RelatedBooksState {
  final List<BookModel> books;

  const RelatedBooksSucess({required this.books});
}

final class RelatedBooksIFailed extends RelatedBooksState {
  final String errMsg;

  const RelatedBooksIFailed({required this.errMsg});
}

final class RelatedBooksLoading extends RelatedBooksState {}
