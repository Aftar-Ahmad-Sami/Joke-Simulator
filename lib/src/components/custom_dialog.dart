import 'dart:async';

import '../constants/object_constants.dart';
import '../constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../views/error_pages/connection_error.dart';
import '../views/joke_result_page.dart';

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
        Navigator.push(
            contex,
            MaterialPageRoute(
                builder: (context) => const ConnectionErrorPage()));
      }
    });
  }
}
