import 'package:flutter/material.dart';

import '../../views/auth/sign_in.dart';

class AnimatedOkAlertDialog extends StatefulWidget {
  const AnimatedOkAlertDialog({super.key});

  @override
  State<AnimatedOkAlertDialog> createState() => _AnimatedOkAlertDialogState();
}

class _AnimatedOkAlertDialogState extends State<AnimatedOkAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('The Email is Verified'),
      content: FadeTransition(
        opacity: _animation,
        child: const Icon(
          Icons.check_circle_rounded,
          size: 60.0,
          color: Colors.green,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
