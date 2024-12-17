import 'package:booksapp/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.lang,
    required this.pagecount,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int pagecount;
  final String lang;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        // const FaIcon(
        //   FontAwesomeIcons.solidStar,
        //   color: Color(0xffFFDD4F),
        //   size: 14,
        // ),
        // const SizedBox(
        //   width: 6.3,
        // ),
        Text(
          lang,
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "($pagecount)",
          style:
              Styles.textStyle14.copyWith(color: Colors.white.withOpacity(.5)),
        )
      ],
    );
  }
}
