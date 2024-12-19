import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchRelevanceBooks(
      {required String categories});
}
