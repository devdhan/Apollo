import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/my_textfield.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/chat_one.dart';
import 'package:tutorials/features/authentication/presentation/reset_password_one.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Secure storage instance to store access token
  final storage = const FlutterSecureStorage();

  // Variables to store error messages
  String emailError = '';
  String passwordError = '';
  String generalError = '';

  // Function to handle sign-in
  Future<void> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    setState(() {
      emailError = '';
      passwordError = '';
      generalError = '';
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        if (email.isEmpty) {
          emailError = '*Email is required*';
        }
        if (password.isEmpty) {
          passwordError = '*Password is required*';
        }
      });
      return;
    }

    // Show loading indicator while waiting for response
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      final response = await Dio().post(
        'https://apollo-server-5yna.onrender.com/v1/auth/signin',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // On success, store the access token
        final token = response.data['response']['data']['token'];
        await storage.write(key: 'access_token', value: token);
        Navigator.of(context).pop(); // Close the loading dialog
        chat(); // Navigate to ChatOne page
      } else {
        // Handle failure
        Navigator.of(context).pop(); // Close the loading dialog
        setState(() {
          generalError = response.data['message'] ?? 'Login failed';
        });
      }
    } catch (e) {
      Navigator.of(context).pop(); // Close the loading dialog
      setState(() {
        generalError = 'Error occurred during $e';
      });
    }
  }

  void resetPasswordOne() {
    // Navigate to ResetPasswordOne page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetPasswordOne()),
    );
  }

  void chat() {
    // Navigate to ChatOne page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ChatOne()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11100B),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
        ),
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
                // Sign in Text
                Text(
                  'Sign in',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF11100B),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Welcome back text
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'APOLLO ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'welcome\'s you back!',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF000000),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Email textfield
                SizedBox(height: 50.h),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                // Display email error message
                if (emailError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        emailError,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                // Password textfield
                SizedBox(height: 30.h),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                // Display password error message
                if (passwordError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        passwordError,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                // Forgot password,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: resetPasswordOne,
                        child: Text(
                          'Forgotten password? Reset',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: const Color(0xBB11100B),
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sign in button
                MyButton(
                  onTap: signIn, // Call the API when button is pressed
                  buttonText: 'Sign in',
                  fontSize: 16.sp,
                  buttoncolor: const Color(0xFF11100B),
                  buttonTextColor: const Color(0xFFEAE3D1),
                ),

                // Display general error message
                if (generalError.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.w, vertical: 5.h),
                    child: Text(
                      generalError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
