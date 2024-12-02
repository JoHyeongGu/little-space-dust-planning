import 'package:flutter/material.dart';

Text titleText(
  BuildContext context,
  String text, {
  TextAlign textAlign = TextAlign.center,
  double maxSize = 30,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width / 20 < maxSize
            ? MediaQuery.of(context).size.width / 20
            : maxSize,
        fontWeight: FontWeight.bold,
        fontFamily: "pixel_dung",
      ),
    );

Text contentText(
  BuildContext context,
  String text, {
  TextAlign textAlign = TextAlign.center,
  double maxSize = 15,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width / 35 < maxSize
            ? MediaQuery.of(context).size.width / 35
            : maxSize,
        fontFamily: "pixel_gal",
      ),
    );
