import 'package:flutter/material.dart';
import 'package:json_to_agha/src/utils/config/my_colors.dart';

import 'my_text.dart';

class MyUserAccountHeader extends StatelessWidget {
  const MyUserAccountHeader({
    super.key,
    // required this.user,
  });

  //final UserModel user;

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(gradient: MyColors.userAccountsDrawerHeader),
      accountName: MyText(' User :   fullName', color: Colors.black),
      accountEmail: MyText(' Phone :  phoneNumber', color: Colors.black),
      currentAccountPicture: Material(
        borderOnForeground: true,
        elevation: 5,
        shadowColor: Colors.blue,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FlutterLogo(),
        // child: CachedNetworkImage(
        //   imageUrl: user.profileImage,
        //   placeholder: (c, i) =>
        //       Center(child: MyTextlabe(fontSize: 12, 'Image Loading')),
        //   height: 130,
        //   width: 130,
        //   fit: BoxFit.cover,
        // )),
        //  currentAccountPicture: (data['profileImage'].toString().isNotEmpty) ? FlutterLogo(),
      ),
    );
  }
}
