import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/object_constants.dart';
import '../../views/sign_in.dart';

void logOutButton() {
  FirebaseAuth.instance.signOut();
  Navigator.pop(contex);
  Navigator.push(
    contex,
    MaterialPageRoute(builder: (context) => const SignIn()),
  );
}
