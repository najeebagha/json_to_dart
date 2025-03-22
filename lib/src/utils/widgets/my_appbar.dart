import 'package:flutter/material.dart';
import '../config/my_colors.dart';
import 'my_container.dart';
import 'my_text.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget {
  String screenName;
  MyAppBar({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      borderRadius: const BorderRadius.vertical(
        top: Radius.zero,
        bottom: Radius.circular(12),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      gradient: MyColors.linearGColAppBar,
      child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 1), //this just Empty Widget
          MyText(screenName),
          SizedBox(width: 1),
        ],
      ),
    );
  }
}
