import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/my_textfield.dart';
import 'package:tutorials/features/authentication/presentation/sign_in.dart';

class ResetPasswordTwo extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPasswordTwo({required this.email, required this.otp, super.key});

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

    try {
      final url = Uri.parse(
          'https://apollo-server-5yna.onrender.com/auth/reset-password');

      final Map<String, dynamic> body = {
        'email': widget.email,
        'otp': widget.otp,
        'newPassword': password,
      };

      // Send POST request to reset password
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['response']['status'] == true) {
          // Password reset successful, navigate to sign-in screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignIn()),
          );
        } else {
          setState(() {
            errorMessage =
                'Failed to reset password: ${responseData['response']['message']}';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Failed to reset password: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
      });
    }
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
