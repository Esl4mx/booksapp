part of 'relevance_books_cubit.dart';

sealed class RelevanceBooksState extends Equatable {
  const RelevanceBooksState();

  @override
  List<Object> get props => [];
}

final class RelevanceBooksInitial extends RelevanceBooksState {}

final class RelevanceBooksLoading extends RelevanceBooksState {}

final class RelevanceBooksSuccess extends RelevanceBooksState {
  final List<BookModel> books;

  const RelevanceBooksSuccess({required this.books});
}

final class RelevanceBooksFaliure extends RelevanceBooksState {
  final String errMessage;

  const RelevanceBooksFaliure({required this.errMessage});
}
