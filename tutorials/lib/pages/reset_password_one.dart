import 'package:flutter/material.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/pages/otp_screen.dart';

class ResetPasswordOne extends StatelessWidget {
  ResetPasswordOne({super.key});

  final emailController = TextEditingController();

  void Otpscreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpScreen()),
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF11100B),
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text('Enter your email to reset password',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),

                //email textfield
                const SizedBox(
                  height: 40,
                ),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  onTap: () => Otpscreen(context),
                  buttonText: 'Next',
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
