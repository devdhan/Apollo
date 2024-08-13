import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tutorials/pages/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
    return const Scaffold(
      backgroundColor: Color(0xFFEAE3D1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'APOLLO',
              style: TextStyle(
                fontFamily: 'Vanguard',
                fontSize: 57,
                fontWeight: FontWeight.w700,
                color: Color(0xFF11100B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
