import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color buttoncolor;
  final Color buttonTextColor;
  final Widget? buttonImage;
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
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        margin: EdgeInsets.symmetric(horizontal: 42.w),
        decoration: BoxDecoration(
          color: widget.buttoncolor,
          border: Border.all(
            width: 1.w,
            color: const Color(0xFF11100B),
          ),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Center(
          child: widget.buttonImage != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.buttonImage!,
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(
                        widget.buttonText,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: widget.buttonTextColor,
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.buttonText,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: widget.buttonTextColor,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
