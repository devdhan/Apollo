import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/pages/chat_one.dart';
import 'package:tutorials/pages/reset_password_one.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void resetPasswordOne(BuildContext context) {
    // Navigate to VerifyEmail page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordOne()),
    );
  }

  void chat(BuildContext context) {
    // Navigate to Chat page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ChatOne()),
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
              children: [
                const SizedBox(height: 60),
                // Sign in Text
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF11100B),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Welcome back text
                const SizedBox(height: 3),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'APOLLO ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'welcome\'s you back!',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Email textfield
                const SizedBox(height: 50),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                // Password textfield
                const SizedBox(height: 30),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // Forgot password,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => resetPasswordOne(context),
                        child: const Text(
                          'Forgotten password? Reset',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xBB11100B),
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sign in button
                MyButton(
                  onTap: () => chat(context),
                  buttonText: 'Sign in',
                  fontSize: 16,
                  buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
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
