import 'package:booksapp/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:booksapp/Features/search/presentation/views_models/cubit/searchbook_cubit.dart';
import 'package:booksapp/core/widgets/custom_error_widget.dart';
import 'package:booksapp/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchbookCubit, SearchbookState>(
      builder: (context, state) {
        if (state is SearchbookSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchbookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
