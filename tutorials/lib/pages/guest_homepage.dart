import 'package:flutter/material.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/pages/guest_chat.dart';

class GuestHomepage extends StatelessWidget {
  const GuestHomepage({super.key});

  // Navigate to GuestChat
  void guestChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GuestChat()),
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
      backgroundColor: const Color.fromRGBO(234, 227, 209, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Image.asset('assets/guessimage.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0),
                child: Center(
                  child: Text(
                    'You’re logged in as a guest',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0),
                child: Center(
                  child: Text(
                    'There will be no history record of whatever you \nsearch on APOLLO ChatBox and everything \nyou search for will clear as soon as you log out or \nclose the application.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //Continue Button
              MyButton(
                fontSize: 16,
                onTap: () => guestChat(context),
                buttonText: 'Continue',
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
