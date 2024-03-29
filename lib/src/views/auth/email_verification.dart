import 'package:demo_project/src/components/alert_dialog/not_verified_alert_dialog.dart';
import 'sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../components/alert_dialog/verified_alert_dialog.dart';
import '../../constants/string_constants.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      _showVerifyEmailCheckDialog(verified: true);
    } else {
      _showVerifyEmailCheckDialog(verified: false);
    }
  }

  Future<void> resendVerificationEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailCheckDialog({required bool verified}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return verified
              ? const AnimatedOkAlertDialog()
              : const NotVerifiedAlertDialog();
        });
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Verification email sent"),
          content:
              const Text("Please check your email and verify your account"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Check Verification"),
              onPressed: () {
                checkEmailVerification();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthX = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Verify your email",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.only(left: widthX * 0.075, right: widthX * 0.075),
            child: const Text(
              "A verification email has been sent to your email address. Please check your email and click on the link to verify your email address.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  resendVerificationEmail();
                },
                child: const Text("Resend Verification Email"),
              ),
              ElevatedButton(
                onPressed: () {
                  checkEmailVerification();
                },
                child: const Text("Check Verification"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
