
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import '../views/profile_screen.dart';
import '../views/sign_in.dart';
import 'circular_avatar_pic.dart';

class CustomJokeDrawer extends StatelessWidget {
  const CustomJokeDrawer({super.key});

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
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            title: const Text("Log Out"),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            },
          ),
          const AboutListTile(
            icon: Icon(
              Icons.info,
            ),
            applicationIcon:
                Icon(Icons.add_reaction, color: Color(0xff218150), size: 50),
            applicationName: 'Joke Simulator',
            applicationVersion: '1.0.0',
            applicationLegalese: 'Copyright © 2023',
            child: Text("About Joke Simulator"),
          ),
        ],
      ),
    );
  }
}
