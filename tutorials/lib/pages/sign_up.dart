import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/pages/verify_email.dart';

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

  // Function to verify email (navigate to another page)
  void verifyEmail(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const VerifyEmail()),
    );
  }

  // Function to sign up a user
  Future<void> signUpUser(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmpasswordController.text;

    // Reset error messages
    setState(() {
      emailError = '';
      passwordError = '';
      confirmPasswordError = '';
    });

    // Validate email and password fields
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        if (email.isEmpty) {
          emailError = '*Email cannot be empty*';
        }
        if (password.isEmpty) {
          passwordError = '*Password cannot be empty*';
        }
        if (confirmPassword.isEmpty) {
          confirmPasswordError = '*Confirm password cannot be empty*';
        }
      });
      return;
    }

    // Check if password and confirm password match
    if (password != confirmPassword) {
      setState(() {
        confirmPasswordError = '*Passwords do not match*';
      });
      return;
    }

    try {
      final url = Uri.parse('{{server_v1_url}}/user/signup');

      // Prepare the request body
      final Map<String, dynamic> body = {
        'email': email,
        'password': password,
      };

      // Send a POST request to the server
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      // Handle response
      if (response.statusCode == 201) {
        // Success response: user created
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          // Proceed to verify email page
          verifyEmail(context);
        }
      } else if (response.statusCode == 409) {
        // Conflict response: Email already exists
        setState(() {
          emailError = 'Email already exists';
        });
      } else {
        setState(() {
          emailError = 'Failed to sign up: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        emailError = 'An error occurred: $e';
      });
    }
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
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Sign up',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF11100B),
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 3),
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
                const SizedBox(height: 50),

                // Email text field
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                // Show email error
                if (emailError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      emailError,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
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
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      passwordError,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
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
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      confirmPasswordError,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                const SizedBox(height: 30),

                // Sign up button
                MyButton(
                  onTap: () => signUpUser(context),
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
