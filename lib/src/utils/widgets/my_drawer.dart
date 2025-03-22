import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  Widget? header;
  List<Widget>? children;
  MyDrawer(
      {super.key,
      required,
      required this.scaffoldKey,
      required this.children,
      this.header});

  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // log('userModel    ${userModel!.fullName}');
    return Drawer(
        backgroundColor: const Color(0xFFC7E2F7),
        child: Column(
          children: [
            if (header != null) header!,
            if (children != null) ...children!,
          ],
        ));
  }
}
