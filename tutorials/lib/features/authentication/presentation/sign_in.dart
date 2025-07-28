import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/features/authservices/auth_service.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/my_textfield.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';
import 'package:tutorials/features/authentication/presentation/reset_password_one.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Variables to store error messages
  String emailError = '';
  String passwordError = '';
  String generalError = '';
  bool isLoading = false;

  // Function to handle sign-in
  Future<void> signIn(BuildContext context) async {
    if (!mounted) return;

    final String email = emailController.text.trim();
    final String password = passwordController.text;

    // Reset error messages
    setState(() {
      emailError = '';
      passwordError = '';
      generalError = '';
    });

    // Validate fields first
    bool hasErrors = false;

    if (email.isEmpty) {
      setState(() {
        emailError = '*Email is required*';
      });
      hasErrors = true;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = '*Password is required*';
      });
      hasErrors = true;
    }

    // If there are validation errors, don't proceed
    if (hasErrors) return;

    // Set loading to true when starting the async operation
    setState(() {
      isLoading = true;
    });

    // Check if widget is still mounted before proceeding
    if (!mounted) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      await authService.value.signIn(
        email: email,
        password: password,
      );

      // Only navigate on successful sign in
      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ChatOne()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        setState(() {
          generalError = e.message ?? 'Sign In Failed';
          isLoading = false;
        });
      }
    } catch (e) {
      // Handle any other exceptions
      if (mounted) {
        setState(() {
          generalError = 'An unexpected error occurred';
          isLoading = false;
        });
      }
    }
  }

  void resetPasswordOne() {
    // Navigate to ResetPasswordOne page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetPasswordOne()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11100B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r)),
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
                  onTap: () => signIn(context),
                  buttonText: 'Sign in',
                  fontSize: 16.sp,
                  buttoncolor: const Color(0xFF11100B),
                  buttonTextColor: const Color(0xFFEAE3D1),
                  isLoading: isLoading,
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
