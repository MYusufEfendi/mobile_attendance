import 'package:flutter/material.dart';
import 'package:mobile_attendance/app/util/util.dart';

class AppContainerStyle {
  BoxDecoration regularContainer({int radius = 10, Color? background}) {
    var backgrounds = Colors.white;
    return BoxDecoration(
        color: backgrounds,
        borderRadius: BorderRadius.circular(radius.width()));
  }

}
