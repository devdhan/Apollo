import 'package:flutter/material.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/pages/chat_one.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  void chat(BuildContext context) {
    // Navigate to VerifyEmail page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatOne()),
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Image.asset('assets/verify_email.png'),
              ),

              //Verify email text
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Verify your email',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF000000),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),

              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'We sent an email to ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'abcde@gmail.com',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  'Please confirm your email and continue\nwith APOLLO as you like.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () => chat(context),
                buttonText: 'Confirm email',
                fontSize: 16,
                buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
                buttonTextColor: const Color(0xFFEAE3D1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
