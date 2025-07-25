import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  void chat(BuildContext context) {
    // Navigate to VerifyEmail page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ChatOne(),
      ),
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
                child: Image.asset('assets/images/verify_email.png'),
              ),

              //Verify email text
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Verify your email',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF000000),
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500),
              ),

              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'We sent an email to ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'abcde@gmail.com',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFF000000),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Please confirm your email and continue\nwith APOLLO as you like.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF000000),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              MyButton(
                onTap: () => chat(context),
                buttonText: 'Confirm email',
                fontSize: 16.sp,
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
