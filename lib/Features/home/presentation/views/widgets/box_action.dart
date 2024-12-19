import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/constants.dart';
import 'package:booksapp/core/utlis/functions/launch_url.dart';
import 'package:booksapp/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxAction extends StatelessWidget {
  const BoxAction({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            fontFamily: kFugazOne,
            buttonText: "Free",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, book.volumeInfo.previewLink);
            },
            fontFamily: kFugazOne,
            fontSize: 16,
            buttonText: getText(book),
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ))
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo.previewLink == null) {
      return "Not Avaliable";
    } else {
      return "preview";
    }
  }
}
