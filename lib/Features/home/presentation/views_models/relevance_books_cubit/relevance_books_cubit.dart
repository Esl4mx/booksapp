import 'package:bloc/bloc.dart';
import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'relevance_books_state.dart';

class RelevanceBooksCubit extends Cubit<RelevanceBooksState> {
  RelevanceBooksCubit(this.homeRepo) : super(RelevanceBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchRelevaanceBooks({required String categories}) async {
    emit(RelevanceBooksLoading());
    var result = await homeRepo.fetchRelevanceBooks(categories: categories);
    result.fold((failure) {
      emit(RelevanceBooksFaliure(errMessage: failure.errMessage));
    }, (books) {
      emit(RelevanceBooksSuccess(books: books));
    });
  }
}
