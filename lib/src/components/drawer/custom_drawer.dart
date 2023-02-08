import 'package:demo_project/src/components/appbar/app_bar_helpers.dart';
import 'package:demo_project/src/components/drawer/drawer_helpers.dart';
import 'package:flutter/material.dart';

import '../../constants/object_constants.dart';
import '../../constants/string_constants.dart';
import '../circular_avatar_pic.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //removes padding from ListView
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.yellow,
                  Colors.blue,
                ],
              )),
              accountName: Text(usernameAllTime),
              accountEmail: Text(emailAllTime),
              currentAccountPicture: const AvatarPic(
                size: 50,
              )),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              contex = context;
              profileTile();
            },
          ),
          ListTile(
            title: const Text("Log Out"),
            onTap: () {
              contex = context;
              logOutButton();
            },
          ),
          AboutListTile(
            icon: const Icon(
              Icons.info,
            ),
            applicationIcon: const Icon(Icons.add_reaction,
                color: Color(0xff218150), size: 50),
            applicationName: flutterTitle,
            applicationVersion: appVersion,
            applicationLegalese: appLegalese,
            child: Text("About $flutterTitle"),
          ),
        ],
      ),
    );
  }
}
