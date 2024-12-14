import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/Features/home/data/repos/home_repo.dart';
import 'package:booksapp/core/errors/failures.dart';
import 'package:booksapp/core/utlis/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiSerrvice apiSerrvice;

  HomeRepoImpl(this.apiSerrvice);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiSerrvice.get(
          endPoint:
              "volumes?Filterring=free-ebooks&Sorting=newest&q=subject:programming");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiSerrvice.get(
          endPoint: "volumes?Filterring=free-ebooks&q=subject:programming");
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
