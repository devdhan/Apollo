import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/my_textfield.dart';
import 'package:tutorials/features/authentication/presentation/verify_email.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // Error message variables
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  // Email validation regex
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> verifyEmail(BuildContext context) async {
    // Check if widget is still mounted before proceeding
    if (!mounted) return;

    final String email = emailController.text.trim();
    final String password = passwordController.text;
    final String confirmPassword = confirmpasswordController.text;

    // Reset error messages
    setState(() {
      emailError = '';
      passwordError = '';
      confirmPasswordError = '';
    });

    // Validate email and password fields
    bool hasErrors = false;

    if (email.isEmpty) {
      setState(() {
        emailError = '*Email cannot be empty*';
      });
      hasErrors = true;
    } else if (!isValidEmail(email)) {
      setState(() {
        emailError = '*Please enter a valid email*';
      });
      hasErrors = true;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = '*Password cannot be empty*';
      });
      hasErrors = true;
    } else if (password.length < 6) {
      setState(() {
        passwordError = '*Password must be at least 6 characters*';
      });
      hasErrors = true;
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        confirmPasswordError = '*Confirm password cannot be empty*';
      });
      hasErrors = true;
    } else if (password != confirmPassword) {
      setState(() {
        confirmPasswordError = '*Passwords do not match*';
      });
      hasErrors = true;
    }

    // If there are validation errors, don't proceed
    if (hasErrors) return;

    // Check if widget is still mounted before navigation
    if (!mounted) return;

    //Navigate to Verify Email
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const VerifyEmail(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
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
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: const Color(0xFF11100B),
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create an account with ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: const Color(0xFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'APOLLO ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: const Color(0xFF000000),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
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

                const SizedBox(height: 25),

                // Password text field
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                // Show password error
                if (passwordError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      passwordError,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                const SizedBox(height: 25),
                // Confirm Password text field
                MyTextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  isPassword: true,
                ),
                // Show confirm password error
                if (confirmPasswordError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      confirmPasswordError,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                SizedBox(height: 30.h),
                // Sign up button
                MyButton(
                  onTap: () => verifyEmail(context),
                  buttonText: 'Sign up',
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
