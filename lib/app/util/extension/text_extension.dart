import 'package:flutter/material.dart';

extension TextExtension on String? {
  Widget text(TextStyle textStyle,
      {TextAlign textAlign = TextAlign.start, Color? color}) {
    var data = "";
    if (toString().isNotEmpty) {
      data = toString();
    }
    var colors = color ?? Colors.black;
    return Text(
      data,
      style: textStyle.copyWith(color: colors),
      textAlign: textAlign,
    );
  }
}
