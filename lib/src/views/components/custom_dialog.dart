import 'dart:async';

import 'package:demo_project/src/views/connection_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/constants.dart';
import '../joke_result_page.dart';

class CustomDialog {
  void loadingDialog(String normalMode) {
    // Loading Dialog
    showDialog(
        //barrierDismissible: false,
        context: contex,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
//                   SpinKitRotatingCircle(
//                     color: Color.fromARGB(255, 7, 106, 255),
// //  size: 50.0,
//                   ),
                  SpinKitWave(
                    color: Color.fromARGB(255, 7, 106, 255),
                    size: 40,
                    type: SpinKitWaveType.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Loading...Please Wait')
                ],
              ),
            ),
          );
        });
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(contex);
      if (normalMode == "joke") {
        Navigator.push(
            contex,
            MaterialPageRoute(
                builder: (context) => JokeResultPage(
                      mode: modeAllTime,
                    )));
      } else if (normalMode == "error") {
        Navigator.push(contex,
            MaterialPageRoute(builder: (context) => const ConnectionError()));
      }
    });
  }
}
