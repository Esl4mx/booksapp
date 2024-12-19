import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/Features/search/data/repos/search_repo.dart';
import 'package:booksapp/core/errors/failures.dart';
import 'package:booksapp/core/utlis/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiSerrvice apiSerrvice;

  SearchRepoImpl(this.apiSerrvice);

  @override
  Future<Either<Failure, List<BookModel>>> featchSearchBook(
      {required String bookName}) async {
    try {
      var data = await apiSerrvice.get(
          endPoint: "volumes?Filterring=free-ebooks&q=$bookName");
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

// try {
//       var data = await apiSerrvice.get(
//           endPoint:
//               "volumes?Filterring=free-ebooks&Sorting=newest&q=computer science");
//       List<BookModel> books = [];
//       for (var item in data["items"]) {
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
  