import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';

void showResetDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        backgroundColor: const Color(0xFFEAE3D1),
        child: Padding(
          padding:
              EdgeInsets.only(top: 25.h, bottom: 20.h, left: 10.w, right: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/ion_log-out.png'),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Password Reset!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Your password has been successfully reset,\nclick below to continue your access.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ChatOne()),
                    (route) => false,
                  );
                },
                child: SizedBox(
                  width: 200.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Return to Login',
                        style: TextStyle(
                            color: const Color(0xFFEAE3D1),
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat'),
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
