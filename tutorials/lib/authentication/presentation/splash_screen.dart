import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tutorials/authentication/presentation/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -2.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Delay for 3 seconds, then start the animation and navigate to WelcomeScreen
    Future.delayed(const Duration(seconds: 3), () {
      _controller.forward().then((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE3D1),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: const Text(
            'APOLLO',
            style: TextStyle(
              fontFamily: 'Vanguard',
              fontSize: 57,
              fontWeight: FontWeight.w700,
              color: Color(0xFF11100B),
            ),
          ),
        ),
      ),
    );
  }
}
