import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/authentication/presentation/otp_screen.dart';

class ResetPasswordOne extends StatefulWidget {
  const ResetPasswordOne({super.key});

  @override
  _ResetPasswordOneState createState() => _ResetPasswordOneState();
}

class _ResetPasswordOneState extends State<ResetPasswordOne> {
  final emailController = TextEditingController();
  String emailError = '';

  // Function to navigate to OTP screen with the email
  void navigateToOtpScreen(BuildContext context, String email) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OtpScreen(email: email)),
    );
  }

  // Function to send OTP
  Future<void> sendOtp(BuildContext context) async {
    final String email = emailController.text;

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
      final url =
          Uri.parse('https://apollo-server-5yna.onrender.com/auth/send-otp');

      // Prepare the request body
      final Map<String, dynamic> body = {
        'email': email,
      };

      // Send POST request
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      // Handle response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['response']['status'] == true) {
          // OTP sent successfully, navigate to OTP screen
          navigateToOtpScreen(context, email);
        } else {
          setState(() {
            emailError =
                'Failed to send OTP: ${responseData['response']['message']}';
          });
        }
      } else if (response.statusCode == 404) {
        setState(() {
          emailError = 'User not found';
        });
      } else {
        setState(() {
          emailError = 'Failed to send OTP. Please try again later.';
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF11100B),
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Enter your email to reset password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),

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

                const SizedBox(height: 30),

                // Next button to trigger OTP request
                MyButton(
                  onTap: () => sendOtp(context),
                  buttonText: 'Next',
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
