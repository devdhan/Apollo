import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/pages/verify_email.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void verifyEmail(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const VerifyEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11100B),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
        toolbarHeight: kToolbarHeight + 49,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
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
              // Main axis alignment
              children: [
                const SizedBox(
                  height: 60,
                ),
                // Sign Up Text
                const Text(
                  'Sign up',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF11100B),
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),

                // Welcome back text
                const SizedBox(
                  height: 3,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create an account with ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'APOLLO ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),

                // Email text field
                const SizedBox(
                  height: 50,
                ),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 25,
                ),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),

                const SizedBox(
                  height: 25,
                ),
                MyTextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  isPassword: true,
                ),

                // Sign in button
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  onTap: () => verifyEmail(context),
                  buttonText: 'Sign up',
                  fontSize: 16,
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
