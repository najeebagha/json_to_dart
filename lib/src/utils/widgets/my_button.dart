import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      this.title,
      this.titleColor,
      this.isLoading = false,
      this.isLoginButton = false,
      this.fontSize,
      this.maxLines,
      this.maxFontSize,
      this.minFontSize,
      this.onPress});

  double? fontSize;
  int? maxLines;
  double? maxFontSize;
  double? minFontSize;
  String? title;
  Color? titleColor;
  bool? isLoginButton;
  VoidCallback? onPress;
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.blue,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0.5, 0.5))
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 80, 80, 80)),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 116, 179, 211),
                Color.fromARGB(255, 59, 109, 173),
                Color.fromARGB(255, 104, 233, 233)
              ])),
      child: MaterialButton(
        onPressed: onPress,
        child: (isLoading == true)
            ? const CircularProgressIndicator()
            : AutoSizeText(
                title!,
                maxLines: maxLines ?? 1,
                maxFontSize: maxFontSize ?? 40,
                minFontSize: minFontSize ?? 8,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    shadows: const [
                      Shadow(color: Colors.grey, offset: Offset(0, -2))
                    ],
                    color: (titleColor == null) ? Colors.white : titleColor,
                    fontSize: (fontSize == null) ? 15 : fontSize),
              ),
      ),
    );
  }
}
