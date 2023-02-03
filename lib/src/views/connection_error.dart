import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Connection Error",
          style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
