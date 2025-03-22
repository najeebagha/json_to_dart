import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  Widget? child;
  double? heightP;
  double? widthP;
  EdgeInsets? padding;
  Alignment? alignment;
  LinearGradient? gradient;
  Color? color;
  Color? shadowColor;
  BorderRadius? borderRadius;

  MyContainer(
      {this.heightP,
      this.widthP,
      this.child,
      this.color,
      this.shadowColor,
      this.gradient,
      this.borderRadius,
      super.key,
      this.alignment,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (padding != null) ? padding : const EdgeInsets.all(0),
      height: (heightP != null)
          ? MediaQuery.of(context).size.height * 1 / 100 * heightP!
          : 100,
      child: Container(
          alignment: (alignment != null) ? alignment : Alignment.center,
          decoration: BoxDecoration(
              color: (color != null) ? color : null,
              // borderRadius: (borderRadius == null)                    ? BorderRadius.circular(12)
              //     : borderRadius,
              boxShadow: [
                BoxShadow(
                    color:
                        (shadowColor != null) ? shadowColor! : Colors.black38,
                    offset: const Offset(1, 1),
                    blurRadius: 2)
              ],
              gradient: gradient ??
                  const LinearGradient(
                      colors: [Color(0xFFC7E2F7), Colors.white])),
          width: (widthP != null)
              ? MediaQuery.of(context).size.width * 1 / 100 * widthP!
              : double.infinity,
          height: (heightP != null)
              ? MediaQuery.of(context).size.height * 1 / 100 * heightP!
              : 100,
          child: (child != null) ? child : const Text('Widget')),
    );
  }
}
