import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/guestmode/presentation/guest_chat.dart';

class GuestHomepage extends StatelessWidget {
  const GuestHomepage({super.key});

  // Navigate to GuestChat
  void guestChat(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const GuestChat()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11100B),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r))),
        toolbarHeight: (kToolbarHeight + 49).h,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
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
              SizedBox(
                height: 70.h,
              ),
              Center(
                child: Image.asset('assets/images/guessimage.png'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Center(
                  child: Text(
                    'You’re logged in as a guest',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF000000)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Center(
                  child: Text(
                    'There will be no history record of whatever you \nsearch on APOLLO ChatBox and everything \nyou search for will clear as soon as you log out or \nclose the application.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              //Continue Button
              MyButton(
                fontSize: 16.sp,
                onTap: () => guestChat(context),
                buttonText: 'Continue',
                buttoncolor: const Color(0xFF11100B),
                buttonTextColor: const Color(0xFFEAE3D1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
