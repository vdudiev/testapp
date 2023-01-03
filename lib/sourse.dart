import 'package:flutter/material.dart';

const blackColor = Colors.black;
const whiteColor = Colors.white;
const transparentColor = Colors.transparent;
const greenColor = Color(0xFF41B592);
const greyColor = Color(0xFFA0ADCE);
const accentColor1 = Color(0xFF345DC7);
const accentColor2 = Color(0xFF9B00FA);
const accentColor3 = Color(0xFFF3A022);
const textGeyColor = Color(0xFFA6A6A6);

TextStyle appTextStyle({
  Color decorationColor = blackColor,
  Color color = Colors.black,
  required double fontSize,
  FontWeight fontWeight = FontWeight.w500,
  TextDecoration decoration = TextDecoration.none,
}) =>
    TextStyle(
        decorationColor: decorationColor,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration);

extension StringToDouble on String {
  double? toDouble() {
    return double.tryParse(this);
  }

  int? toInt() {
    return int.tryParse(this);
  }
}

extension doubleAsFixed on double {
  String toOneFixedString() {
    if (toDouble() % 1 == 0) {
      return toStringAsFixed(0);
    } else {
      return toStringAsFixed(1);
    }
  }
}
