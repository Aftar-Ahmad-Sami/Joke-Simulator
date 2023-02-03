import 'package:flutter/material.dart';

class ConnectionErrorPage extends StatefulWidget {
  const ConnectionErrorPage({super.key});

  @override
  State<ConnectionErrorPage> createState() => _ConnectionErrorPageState();
}

class _ConnectionErrorPageState extends State<ConnectionErrorPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildLargeScreenLayout();
          } else {
            return _buildSmallScreenLayout();
          }
        },
      ),
    );
  }

  Widget _buildLargeScreenLayout() {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.bounceInOut,
                ),
              ),
              child: const Icon(
                Icons.signal_wifi_off,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No Internet Connection',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please check your internet connection and try again',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallScreenLayout() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.bounceInOut,
                ),
              ),
              child: const Icon(
                Icons.signal_wifi_off,
                size: 75,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No Internet Connection',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please check your internet connection and try again',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
