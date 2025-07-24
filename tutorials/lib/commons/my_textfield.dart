import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isPassword;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.isPassword = false,
  });

  @override
  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  late bool _obscureText;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    widget.controller.addListener(_checkText);
  }

  void _checkText() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    // Remove listener when disposing
    widget.controller.removeListener(_checkText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.0.h),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : widget.obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF11100B)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF11100B)),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: const Color(0x8F000000),
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          suffixIcon: widget.isPassword && _hasText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF11100B),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
