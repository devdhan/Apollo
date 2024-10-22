import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/pages/sign_in.dart';

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
      final url = Uri.parse('{{server_v1_url}}/auth/reset-password');

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
            MaterialPageRoute(builder: (context) => SignIn()),
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
                const Text('Enter your new password',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),

                const SizedBox(height: 40),

                // Password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(height: 15),

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
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                const SizedBox(height: 30),

                // Reset password button
                MyButton(
                  onTap: () => resetPassword(context),
                  buttonText: 'Reset Password',
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
