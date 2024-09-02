import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        margin: const EdgeInsets.symmetric(horizontal: 42.0),
        decoration: BoxDecoration(
          color: buttoncolor,
          border: Border.all(
            width: 1.0,
            color: const Color.fromRGBO(17, 16, 11, 1),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: buttonImage != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonImage!,
                    const SizedBox(width: 8.0),
                    Flexible(
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: buttonTextColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
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
                  overflow: TextOverflow.ellipsis, // Handle overflow
                ),
        ),
      ),
    );
  }
}
