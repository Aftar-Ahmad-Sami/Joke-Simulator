import '../components/custom_circular_progress.dart';
import 'error_pages/connection_error.dart';
import 'home.dart';
import 'sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthChecking extends StatelessWidget {
  const AuthChecking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CustomCircularProgress());
            } else if (snapshot.hasError) {
              return const ConnectionErrorPage();
            } else {
              return const SignIn();
            }
          }),
    );
  }
}
