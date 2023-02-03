import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/color_constants.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: loadingColorSet,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: MediaQuery.of(context).size.width > 400
            ? const SpinKitFoldingCube(
                color: Colors.white,
                size: 100.0,
              )
            : const SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
              ),
      ),
    );
  }
}
