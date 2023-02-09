import 'src/constants/color_constants.dart';
import 'src/constants/string_constants.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'src/views/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

//final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  navigatorKey: navigatorKey,

      title: flutterTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primarySwatchColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: fontFamilyInApp),
      home: //VerifyEmailPage()
          const SplashScreen(),
    );
  }
}
