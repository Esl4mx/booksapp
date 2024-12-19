import 'package:booksapp/Features/home/presentation/views_models/relevance_books_cubit/relevance_books_cubit.dart';
import 'package:booksapp/core/widgets/custom_error_widget.dart';
import 'package:booksapp/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelevanceBooksCubit, RelevanceBooksState>(
      builder: (context, state) {
        if (state is RelevanceBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    ));
              },
            ),
          );
        } else if (state is RelevanceBooksFaliure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
