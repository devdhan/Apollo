import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/guestmode/presentation/guest_homepage.dart';
import 'package:tutorials/features/authentication/presentation/sign_in.dart';
import 'package:tutorials/features/authentication/presentation/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void signino() {}

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
                  MyButton(
                    onTap: signino,
                    buttonText: 'Continue with Gmail',
                    fontSize: 16.sp,
                    buttoncolor: const Color(0xFFEAE3D1),
                    buttonTextColor: const Color(0xFF11100B),
                    buttonImage: Image.asset(
                      'assets/googlebtn_image.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
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
