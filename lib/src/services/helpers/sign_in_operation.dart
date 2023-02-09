import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../constants/object_constants.dart';
import '../../constants/string_constants.dart';
import 'snack_bar_operation.dart';

Future signInOperation(
    String usernameController, String passwordController) async {
  if (usernameController == "" || passwordController == "") {
    snackBarOperation(text: "E M P T Y   F I E L D");
  } else {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.trim(),
        password: passwordController.trim(),
      );
      final storageRef = FirebaseStorage.instance.ref();
      final imageUrl = await storageRef.child(emailAllTime).getDownloadURL();
      img = NetworkImage(imageUrl);
      return true;
    } on FirebaseAuthException catch (e) {
      late String str;
      if (e.toString().contains('password')) {
        str = "I N V A L I D    P A S S W O R D";
      } else {
        str = "I N V A L I D    E M A I L";
      }
      snackBarOperation(text: str);
    }
  }
}
