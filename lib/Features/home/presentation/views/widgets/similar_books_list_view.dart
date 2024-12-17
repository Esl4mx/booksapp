import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imageUrl: "https://images.app.goo.gl/3PM9ApnEYT7XMjiPA",
              ));
        },
      ),
    );
  }
}
