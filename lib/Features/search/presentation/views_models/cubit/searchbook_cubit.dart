import 'package:bloc/bloc.dart';
import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'searchbook_state.dart';

class SearchbookCubit extends Cubit<SearchbookState> {
  SearchbookCubit(this.searchRepo) : super(SearchbookInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBook({required String bookName}) async {
    emit(SearchbookLoading());
    var result = await searchRepo.featchSearchBook(bookName: bookName);
    result.fold((failure) {
      emit(SearchbookFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchbookSuccess(books: books));
    });
  }
}



  // final HomeRepo homeRepo;

  // Future<void> fetchFeaturedBooks() async {
  //   emit(FeaturedBooksLoading());
  //   var result = await homeRepo.fetchFeaturedBooks();
  //   result.fold((failure) {
  //     emit(FeaturedBooksFailure(failure.errMessage));
  //   }, (books) {
  //     emit(FeaturedBooksSuccess(books));
  //   });
  // }