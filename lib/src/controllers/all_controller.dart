import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/src/views/auth/email_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../constants/object_constants.dart';
import '../services/api/get_joke_from_api.dart';
import '../services/models/user_info_model.dart';
import '../constants/string_constants.dart';

class AllController {
  getJoke(String url, String mode) async {
    await GetJokeFromApi().getResponse(url, mode);
    // customDialog.loadingDialog("joke");
  }

  void getData() async {
    final emailX = FirebaseAuth.instance.currentUser!.email!;
    final docRef = FirebaseFirestore.instance.collection('users').doc(emailX);

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        final userInfo = UserInfoModel.fromJson(data);
        emailAllTime = userInfo.email!;
        usernameAllTime = userInfo.username!;
        numberAllTime = userInfo.phoneNumber!;
        genderAllTime = userInfo.gender!;
        passwordAllTime = userInfo.password!;
        bioAllTime = userInfo.bio!;
      },
    );
    final storageRef = FirebaseStorage.instance.ref();
    final imageUrl = await storageRef.child(emailAllTime).getDownloadURL();
    userImage = imageUrl;
  }

  void getUserImageLink() async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageUrl = await storageRef.child(emailAllTime).getDownloadURL();
    userImage = imageUrl;
  }

  Future createUser(
      {required user,
      required password,
      required number,
      required email,
      required gender}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .then((value) async {
        var userStatus = value.additionalUserInfo?.isNewUser;
        if (userStatus == true) {
          final temp =
              FirebaseFirestore.instance.collection('users').doc(email);

          final json = {
            'email': email,
            'number': number,
            'password': password,
            'username': user,
            'gender': gender,
            'bio': ""
          };
          await temp.set(json);
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          Future.delayed(Duration.zero).then((value) => Navigator.pop(contex));
          Future.delayed(Duration.zero)
              .then((value) => Navigator.pushReplacement(
                    contex,
                    MaterialPageRoute(
                        builder: (context) => const VerifyEmailPage()),
                  ));
        }
      });
    } catch (ex) {
      ScaffoldMessenger.of(contex).showSnackBar(
        //  String
        SnackBar(content: Text(ex.toString())),
      );
    }
  }
}
