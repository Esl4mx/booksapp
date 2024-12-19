import 'package:booksapp/core/utlis/styles.dart';
import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          const Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}
