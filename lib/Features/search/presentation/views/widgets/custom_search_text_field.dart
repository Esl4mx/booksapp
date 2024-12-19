import 'package:booksapp/Features/search/presentation/views_models/cubit/searchbook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  final TextEditingController bookName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: bookName,
      decoration: InputDecoration(
          enabledBorder: BuildoutLinedInputBorder(),
          focusedBorder: BuildoutLinedInputBorder(),
          hintText: "Search",
          suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<SearchbookCubit>(context)
                    .fetchSearchBook(bookName: bookName.text);
              },
              icon: const Opacity(
                opacity: 0.7,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                ),
              ))),
    );
  }

  OutlineInputBorder BuildoutLinedInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12));
  }
}
