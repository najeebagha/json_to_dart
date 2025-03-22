import 'package:flutter/material.dart';

class MySizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const aboutDialog = 56.0;
  static const appBarExpandedSize = 180.0;
  static const tileWidth = 148.0;
  static const tileHeight = 276.0;

  static Size appBarSize(BuildContext context) {
    var widthp = MediaQuery.of(context).size.width * 1 / 100;
    var heightP = MediaQuery.of(context).size.height * 1 / 100;

    return Size(widthp * 100, heightP * 08);
  }
}
