import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextfieldWidget extends StatefulWidget {
  final Function(String) onCodeChanged; // Callback to pass OTP to parent

  const OtpTextfieldWidget({required this.onCodeChanged, super.key});

  @override
  _OtpTextfieldWidgetState createState() => _OtpTextfieldWidgetState();
}

class _OtpTextfieldWidgetState extends State<OtpTextfieldWidget> {
  // List of controllers for each OTP field
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  // Function to collect the full OTP and pass it to the parent widget
  void _collectOtp() {
    final otp = _controllers.map((controller) => controller.text).join();
    widget.onCodeChanged(otp); // Send the collected OTP
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => CustomField(
            controller: _controllers[index],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus(); // Move to next field
              }
              _collectOtp(); // Collect the full OTP each time any field changes
            },
          ),
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CustomField(
      {required this.controller, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.h,
      width: 66.w,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFF11100B)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFF11100B)),
          ),
        ),
      ),
    );
  }
}
