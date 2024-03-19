import 'package:flutter/material.dart';
import 'package:mobile_attendance/app/util/util.dart';

class AppButtonStyle {
  ButtonStyle enableStyle(
      {Color? background, double? borderRadius, Color? textColor}) {
    var backgrounds = background ??  const Color(0xff459467);
    var textColors = background ?? Color(0xffF2F2F2);
    return ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(42.width()),
        padding: EdgeInsets.symmetric(horizontal: 12.width(), vertical: 0),
        primary: backgrounds,
        onPrimary: textColors,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6.width())),
        shadowColor: Colors.transparent,
        elevation: 0);
  }

  ButtonStyle greyStyle(
      {Color? background, double? borderRadius, Color? textColor}) {
    var backgrounds = background ??  const Color(0xff459467);
    var textColors = background ?? Color(0xffF2F2F2);
    return ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(42.width()),
        padding: EdgeInsets.zero,
        primary: backgrounds,
        onPrimary: textColors,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6.width())),
        shadowColor: Colors.transparent,
        elevation: 0);
  }

  ButtonStyle disableStyle(
      {Color? background, double? borderRadius, Color? textColor}) {
    var backgrounds = background ??  const Color(0xff459467);
    var textColors = background ?? Color(0xffF2F2F2);
    return ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(42.width()),
        padding: EdgeInsets.zero,
        primary: backgrounds,
        onPrimary: textColors,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6.width())),
        shadowColor: Colors.transparent,
        elevation: 0);
  }

  ButtonStyle borderStyle(
      {Color? background,
      double? borderRadius,
      Color? textColor,
      Color? borderColor}) {
    var backgrounds = background ??  const Color(0xff459467);
    var textColors = background ?? const Color(0xffF2F2F2);
    var borderColors = borderColor ?? const Color(0xffD6D6D6);
    return ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(42.width()),
        padding: EdgeInsets.zero,
        primary: backgrounds,
        onPrimary: textColors,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6.width()),
            side: BorderSide(color: borderColors)),
        shadowColor: Colors.transparent,
        elevation: 0);
  }
}
