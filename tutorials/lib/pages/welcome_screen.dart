import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/pages/guest_homepage.dart';
import 'package:tutorials/pages/sign_in.dart';
import 'package:tutorials/pages/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void signino() {}

  void signin(BuildContext context) {
    // Navigate to Signin page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  void signup(BuildContext context) {
    // Navigate to Signup page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  void guestMode(BuildContext context) {
    // Navigate to GuestHomepage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GuestHomepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE3D1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 140),
                  Image.asset(
                    'assets/APOLLO.png',
                    height: 52,
                    width: 99,
                  ),
                  // const Text(
                  //   'APOLLO',
                  //   style: TextStyle(
                  //     fontFamily: 'Vanguard',
                  //     fontSize: 43,
                  //     fontWeight: FontWeight.w700,
                  //     color: Color(0xFF11100B),
                  //   ),
                  // ),
                  const SizedBox(height: 8),
                  const Text(
                    'Let’s get started',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 65),
                  MyButton(
                    onTap: () => signup(context),
                    buttonText: 'Sign up',
                    fontSize: 16,
                    buttoncolor: const Color(0xFF11100B),
                    buttonTextColor: const Color(0xFFEAE3D1),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    onTap: () => signup(context),
                    buttonText: 'Continue with an account',
                    fontSize: 16,
                    buttoncolor: const Color(0x00D9D9D9),
                    buttonTextColor: const Color(0xFF11100B),
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    onTap: signino,
                    buttonText: 'Continue with gmail',
                    fontSize: 16,
                    buttoncolor: const Color(0x00D9D9D9),
                    buttonTextColor: const Color(0xFF11100B),
                    buttonImage: Image.asset(
                      'assets/googlebtn_image.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MyButton(
                  onTap: () => guestMode(context),
                  buttonText: 'Guest mode',
                  fontSize: 16,
                  buttoncolor: const Color(0xFF11100B),
                  buttonTextColor: const Color(0xFFEAE3D1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
