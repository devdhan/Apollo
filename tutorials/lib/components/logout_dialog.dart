import 'package:flutter/material.dart';
import 'package:tutorials/pages/welcome_screen.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        backgroundColor: const Color(0xFFEAE3D1),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/ion_log-out.png'),
              const SizedBox(height: 10),
              const Text(
                'Oh no! You’re leaving...\nAre you sure?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: SizedBox(
                  width: 200,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Nah, just kidding',
                        style: TextStyle(
                          color: Color(0xFFEAE3D1),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  ); // Navigate to WelcomeScreen
                },
                child: SizedBox(
                  width: 200,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEAE3D1),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: const Color(0xFF11100B))),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Yes, log me out',
                        style: TextStyle(
                          color: Color(0xFF11100B),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
