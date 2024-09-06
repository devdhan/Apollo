import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/my_textfield.dart';
import 'package:tutorials/pages/sign_in.dart';

class ResetPasswordTwo extends StatelessWidget {
  ResetPasswordTwo({super.key});

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void signIn(BuildContext context) {
    // Navigate to VerifyEmail page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
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
                const Text('Enter your new password',
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
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  onTap: () => signIn(context),
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
