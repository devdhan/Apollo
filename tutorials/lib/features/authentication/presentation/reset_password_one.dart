import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/auth_service.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/my_textfield.dart';
import 'package:tutorials/features/authentication/presentation/reset_sent_page.dart';

class ResetPasswordOne extends StatefulWidget {
  const ResetPasswordOne({super.key});

  @override
  _ResetPasswordOneState createState() => _ResetPasswordOneState();
}

class _ResetPasswordOneState extends State<ResetPasswordOne> {
  final emailController = TextEditingController();
  String emailError = '';

  // Function to send OTP
  Future<void> sendOtp(BuildContext context) async {
    final String email = emailController.text.trim();

    // Reset error message
    setState(() {
      emailError = '';
    });

    // Validate email field
    if (email.isEmpty) {
      setState(() {
        emailError = '*Email cannot be empty*';
      });
      return;
    }
    try {
      await authService.value.resetPassword(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        emailError = e.message ?? 'Failed to reset Password';
      });
    }
    // Function to navigate to OTP screen with the email
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetSentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11100B),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))),
        toolbarHeight: (kToolbarHeight + 49).h,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFFEAE3D1),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      backgroundColor: const Color(0xFFEAE3D1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF11100B),
                    fontWeight: FontWeight.w700,
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Enter your email to reset password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 40.h),

                // Email text field
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                // Show email error
                if (emailError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      emailError,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                SizedBox(height: 30.h),

                // Next button to trigger OTP request
                MyButton(
                  onTap: () => sendOtp(context),
                  buttonText: 'Next',
                  fontSize: 16.sp,
                  buttoncolor: const Color(0xFF11100B),
                  buttonTextColor: const Color(0xFFEAE3D1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
