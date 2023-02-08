import 'package:demo_project/src/components/appbar/app_bar_helpers.dart';
import 'package:demo_project/src/constants/string_constants.dart';
import 'package:flutter/material.dart';

import '../../constants/object_constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(flutterTitle),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: listOfActions(context: context),
    );
  }

  List<Widget>? listOfActions({required BuildContext context}) {
    return [
      IconButton(
          onPressed: () {
            contex = context;
            logOutButton();
          },
          icon: const Icon(Icons.logout))
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
