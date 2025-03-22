import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  MyText(this.text,
      {super.key,
      this.fontSize,
      this.color,
      this.textAlign,
      this.maxLines,
      this.maxFontSize,
      this.minFontSize});

  String text;
  double? fontSize;
  int? maxLines;
  double? maxFontSize;
  double? minFontSize;
  Color? color;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines ?? 1,
      maxFontSize: maxFontSize ?? 40,
      minFontSize: minFontSize ?? 8,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          color: (color == null) ? Colors.black : color,
          fontSize: (fontSize == null) ? 15 : fontSize),
    );
  }
}
