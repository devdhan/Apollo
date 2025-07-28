import 'package:flutter/material.dart';
import 'package:tutorials/features/authservices/auth_service.dart';
import 'package:tutorials/commons/app_loading_page.dart';
import 'package:tutorials/features/authentication/presentation/welcome_screen.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = AppLoadingPage();
            } else if (snapshot.hasData) {
              widget = const ChatOne();
            } else {
              widget = pageIfNotConnected ?? const WelcomeScreen();
            }
            return widget;
          },
        );
      },
    );
  }
}
