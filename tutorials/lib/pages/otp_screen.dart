import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/otp_textfield_widget.dart';
import 'package:tutorials/pages/reset_password_two.dart';

class OtpScreen extends StatefulWidget {
  final String email; // Receive email from the previous screen

  const OtpScreen({required this.email, super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  String otpError = '';

  // Function to navigate to reset password screen
  void navigateToResetPassword(BuildContext context, String email, String otp) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPasswordTwo(email: email, otp: otp),
      ),
    );
  }

  // Function to verify OTP
  Future<void> verifyOtp(BuildContext context) async {
    // Reset error message
    setState(() {
      otpError = '';
    });

    if (otp.isEmpty || otp.length != 4) {
      setState(() {
        otpError = 'Invalid OTP';
      });
      return;
    }

    try {
      final url = Uri.parse('{{server_v1_url}}/auth/verify-otp');

      final Map<String, dynamic> body = {
        'email': widget.email,
        'otp': otp,
      };

      // Send POST request
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
          // OTP verified, navigate to reset password screen
          navigateToResetPassword(context, widget.email, otp);
        } else {
          setState(() {
            otpError =
                'Failed to verify OTP: ${responseData['response']['message']}';
          });
        }
      } else {
        setState(() {
          otpError = 'Failed to verify OTP: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        otpError = 'An error occurred: $e';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  'OTP',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF11100B),
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Enter OTP to verify email',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),

                // OTP TextField widget
                OtpTextfieldWidget(
                  onCodeChanged: (String code) {
                    setState(() {
                      otp = code;
                    });
                  },
                ),

                // Show OTP error message
                if (otpError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      otpError,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                const SizedBox(height: 30),

                // Verify OTP button
                MyButton(
                  onTap: () => verifyOtp(context),
                  buttonText: 'Verify',
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
