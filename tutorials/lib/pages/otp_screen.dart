import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/components/otp_textfield_widget.dart';
import 'package:tutorials/pages/reset_password_two.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  void resetPasswordTwo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordTwo()),
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'OTP',
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
              const Text('Please enter the OTP sent to your email',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )),
              //OTP TEXTFIELD
              const SizedBox(
                height: 35,
              ),
              const OtpTextfieldWidget(),
              //OTP TEXT
              const SizedBox(
                height: 20,
              ),
              const Text('Didn\'t recieved an OTP?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xBB11100B),
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  )),
              const SizedBox(
                height: 2,
              ),
              const Text('Resend an OTP',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF000000),
                      fontSize: 14,
                      decoration: TextDecoration.underline)),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onTap: () => resetPasswordTwo(context),
                buttonText: 'Verify',
                fontSize: 16,
                buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
                buttonTextColor: const Color(0xFFEAE3D1),
              )
            ],
          ),
        )),
      ),
    );
  }
}
