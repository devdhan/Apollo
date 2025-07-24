import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color buttoncolor;
  final Color buttonTextColor;
  final Image? buttonImage;
  final double fontSize;

  const MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttoncolor,
    required this.buttonTextColor,
    required this.fontSize,
    this.buttonImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        margin: EdgeInsets.symmetric(horizontal: 42.w),
        decoration: BoxDecoration(
          color: buttoncolor,
          border: Border.all(
            width: 1.w,
            color: const Color(0xFF11100B),
          ),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Center(
          child: buttonImage != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonImage!,
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: buttonTextColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: buttonTextColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
