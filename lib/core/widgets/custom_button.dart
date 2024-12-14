import 'package:booksapp/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.buttonText,
    this.fontSize,
    this.fontFamily,
  });
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String buttonText;
  final double? fontSize;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(16))),
          child: Text(
            buttonText,
            style: Styles.textStyle18.copyWith(
                fontSize: fontSize,
                color: textColor,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}
