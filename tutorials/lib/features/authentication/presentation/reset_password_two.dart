import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/my_textfield.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';

class ResetPasswordTwo extends StatefulWidget {
  const ResetPasswordTwo({super.key});

  @override
  _ResetPasswordTwoState createState() => _ResetPasswordTwoState();
}

class _ResetPasswordTwoState extends State<ResetPasswordTwo> {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  String errorMessage = '';

  // Function to reset the password
  Future<void> resetPassword(BuildContext context) async {
    final String password = passwordController.text;
    final String confirmPassword = confirmpasswordController.text;

    // Clear the previous error message
    setState(() {
      errorMessage = '';
    });

    if (password.isEmpty) {
      setState(() {
        errorMessage = 'Enter a new password';
      });
      return;
    }
    // Validate if passwords match
    if (password != confirmPassword) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }

    // Validate password length
    if (password.length < 6) {
      setState(() {
        errorMessage = 'Password must be at least 6 characters long';
      });
      return;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatOne(),
      ),
      (route) => false,
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
                Text('Enter your new password',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    )),

                SizedBox(height: 40.h),

                // Password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                SizedBox(height: 15.h),

                // Confirm password textfield
                MyTextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  isPassword: true,
                ),

                // Error message (if any)
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                SizedBox(height: 30.h),

                // Reset password button
                MyButton(
                  onTap: () => resetPassword(context),
                  buttonText: 'Reset Password',
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
