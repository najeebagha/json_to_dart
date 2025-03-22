import 'package:flutter/material.dart';

import 'my_colors.dart';

class Mytheme {
  static ThemeData lighTeme() {
    return ThemeData.light().copyWith(
      inputDecorationTheme: InputDecorationTheme(
        outlineBorder: OutlineInputBorder().borderSide,
        // border: InputBorder.none,
        contentPadding: const EdgeInsets.all(3),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: MyColors.appBarColor, foregroundColor: Colors.black),
      scaffoldBackgroundColor: MyColors.backGroundColor,
    );
  }
}
