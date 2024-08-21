import 'package:calculator/app/utils/colors.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String textTitle;
  final TextStyle? fontSize;

  const TextTitle(this.textTitle, {super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return  Text(
      textTitle,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor
      ),
    );
  }
}
