import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final onTap;
  final String buttonText;
  final Color buttoncolor;
  final Color buttonTextColor;
  final buttonImage;
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
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 42.0),
        decoration: BoxDecoration(
          color: buttoncolor,
          border: Border.all(
              width: 1.0, color: const Color.fromRGBO(17, 16, 11, 1)),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: buttonImage != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonImage!,
                    const SizedBox(width: 10),
                    Text(
                      buttonText,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: buttonTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                ),
        ),
      ),
    );
  }
}
