import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/commons/otp_textfield_widget.dart';
import 'package:tutorials/features/authentication/presentation/reset_password_two.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  String otpError = '';

  // Function to verify OTP
  Future<void> verifyOtp(BuildContext context) async {
    setState(() {
      otpError = '';
    });

    if (otp.isEmpty || otp.length != 4) {
      setState(() {
        otpError = 'Invalid OTP';
      });
      return;
    }
    // Function to navigate to reset password screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordTwo(),
      ),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Text(
                  'OTP',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF11100B),
                    fontWeight: FontWeight.w700,
                    fontSize: 32.sp,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Enter OTP to verify email',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 40.h),

                // OTP TextField widget
                OtpTextfieldWidget(
                  onCodeChanged: (String code) {
                    setState(() {
                      otp = code;
                    });
                  },
                ),

                // Show OTP error
                if (otpError.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      otpError,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                SizedBox(height: 30.h),

                // Verify button
                MyButton(
                  onTap: () => verifyOtp(context),
                  buttonText: 'Verify',
                  fontSize: 16.sp,
                  buttoncolor: const Color(0xFF11100B),
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
