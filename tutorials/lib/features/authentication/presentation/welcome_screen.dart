import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/authservices/auth_service.dart';
import 'package:tutorials/features/guestmode/presentation/guest_homepage.dart';
import 'package:tutorials/features/authentication/presentation/sign_in.dart';
import 'package:tutorials/features/authentication/presentation/sign_up.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String errorMessage = '';
  bool isLoading = false;

  Future<void> signInWithGoogle() async {
    setState(() {
      errorMessage = '';
      isLoading = true;
    });

    try {
      await authService.value.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message ?? 'Authentication Failed';
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ChatOne()),
      (route) => false,
    );
  }

  void signInWithApple() {
    // Handle Apple Sign In for iOS
    print('Signing in with Apple');
  }

  void signin(BuildContext context) {
    // Navigate to SignIn page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  void signup(BuildContext context) {
    // Navigate to SignUp page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  void guestMode(BuildContext context) {
    // Navigate to GuestHomepage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GuestHomepage()),
    );
  }

  String get platformButtonText {
    if (Platform.isAndroid) {
      return 'Continue with Gmail';
    } else {
      return 'Continue with Apple';
    }
  }

  Widget get platformButtonImage {
    if (Platform.isAndroid) {
      return Image.asset(
        'assets/images/googlebtn_image.png',
        width: 30.w,
        height: 30.h,
      );
    } else {
      return Image.asset(
        'assets/images/apple.png',
        width: 30.w,
        height: 25.h,
      );
    }
  }

  VoidCallback get platformOnTap {
    if (Platform.isAndroid) {
      return signInWithGoogle;
    } else {
      return signInWithApple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE3D1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 140.h),
                  Text(
                    'APOLLO',
                    style: TextStyle(
                      fontFamily: 'Vanguard',
                      fontSize: 55.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF11100B),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Let’s get started',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 65.h),
                  MyButton(
                    onTap: () => signup(context),
                    buttonText: 'Sign up',
                    fontSize: 16.sp,
                    buttoncolor: const Color(0xFF11100B),
                    buttonTextColor: const Color(0xFFEAE3D1),
                  ),
                  SizedBox(height: 20.h),
                  MyButton(
                    onTap: () => signin(context),
                    buttonText: 'Continue with an account',
                    fontSize: 16.sp,
                    buttoncolor: const Color(0xFFEAE3D1),
                    buttonTextColor: const Color(0xFF11100B),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.w),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  //Button Google or Apple
                  MyButton(
                    onTap: platformOnTap,
                    buttonText: platformButtonText,
                    fontSize: 16.sp,
                    buttoncolor: const Color(0xFFEAE3D1),
                    buttonTextColor: const Color(0xFF11100B),
                    buttonImage: platformButtonImage,
                    isLoading: isLoading,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25.h),
                child: MyButton(
                  onTap: () => guestMode(context),
                  buttonText: 'Guest mode',
                  fontSize: 16.sp,
                  buttoncolor: const Color(0xFF11100B),
                  buttonTextColor: const Color(0xFFEAE3D1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
