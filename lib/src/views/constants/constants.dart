import 'package:demo_project/src/views/components/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import '../../controllers/all_controller.dart';

String joke = "";
String twopart = "";
String modeAllTime = "single";

late BuildContext contex;
String usernameAllTime = " ";
String emailAllTime = " ";
String numberAllTime = " ";
String genderAllTime = " ";
String passwordAllTime = " ";
String bioAllTime = " ";
String userImage =
    'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png';

AllController allControl = AllController();

CustomDialog customDialog = CustomDialog();

NetworkImage img = const NetworkImage(
    'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png');
