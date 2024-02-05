// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.firstText,
    required this.secondText,
    super.key,
    this.firstTextColor,
    this.secondTextColor,
    this.lineHeight,
  });

  final String firstText;
  final String secondText;

  final Color? firstTextColor;
  final Color? secondTextColor;
  final double? lineHeight;

  final int _maxLines = 6;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: _maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: firstText, style: TextStyle(fontWeight: FontWeight.bold, color: firstTextColor, height: lineHeight)),
          TextSpan(text: ' $secondText', style: TextStyle(color: secondTextColor, height: lineHeight)),
        ],
      ),
    );
  }
}
