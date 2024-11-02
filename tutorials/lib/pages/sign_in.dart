import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/pages/chat_one.dart';
import 'package:tutorials/pages/reset_password_one.dart';
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
      MaterialPageRoute(builder: (context) => ResetPasswordOne()),
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
                // Display email error message
                if (emailError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 43.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        emailError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                // Password textfield
                const SizedBox(height: 30),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                // Display password error message
                if (passwordError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 43.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        passwordError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                // Forgot password,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: resetPasswordOne,
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
                  onTap: signIn, // Call the API when button is pressed
                  buttonText: 'Sign in',
                  fontSize: 16,
                  buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
                  buttonTextColor: const Color(0xFFEAE3D1),
                ),

                // Display general error message
                if (generalError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 42.0, vertical: 5.0),
                    child: Text(
                      generalError,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 10,
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
