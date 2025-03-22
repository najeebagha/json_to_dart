import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyDecoration {
  static const boxShadow =
      BoxShadow(color: Colors.black38, offset: Offset(1, 1), blurRadius: 2);
  static const boxDecoration = BoxDecoration(gradient: MyColors.linearGColor);
  static final borderCirculer = BorderRadius.circular(12);
}
