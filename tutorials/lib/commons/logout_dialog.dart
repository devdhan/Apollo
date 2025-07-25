import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/auth_service.dart';
import 'package:tutorials/features/authentication/presentation/welcome_screen.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        backgroundColor: const Color(0xFFEAE3D1),
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/ion_log-out.png'),
              SizedBox(height: 10.h),
              Text(
                'Oh no! You’re leaving...\nAre you sure?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 5.h),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: SizedBox(
                  width: 200.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Nah, just kidding',
                        style: TextStyle(
                            color: const Color(0xFFEAE3D1),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  try {
                    await authService.value.signOut();
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  ); // Navigate to WelcomeScreen
                },
                child: SizedBox(
                  width: 200.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEAE3D1),
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: const Color(0xFF11100B))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Yes, log me out',
                        style: TextStyle(
                            color: const Color(0xFF11100B),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
