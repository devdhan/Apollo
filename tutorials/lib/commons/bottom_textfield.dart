import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomTextField extends StatefulWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  final Function(String) onSendMessage;

  const BottomTextField({
    super.key,
    required this.messageController,
    required this.focusNode,
    required this.onSendMessage,
  });

  @override
  _BottomTextFieldState createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends State<BottomTextField> {
  late bool _isTextFieldFocused;

  void _handleSendMessage() {
    if (widget.messageController.text.trim().isNotEmpty) {
      widget.onSendMessage(widget.messageController.text);
    }
  }

  @override
  void initState() {
    super.initState();
    _isTextFieldFocused = widget.focusNode.hasFocus;
    widget.focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = widget.focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 30,
            offset: const Offset(0, 0.5),
          ),
        ],
        color: const Color(0xFFFFFFFF),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 12.w),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45.h,
                child: TextField(
                  style: TextStyle(
                    color: const Color(0xAA000000),
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                  ),
                  controller: widget.messageController,
                  focusNode: widget.focusNode,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (value) => _handleSendMessage(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _isTextFieldFocused
                        ? const Color(0xFFE6E6E6)
                        : Colors.transparent,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'Ask anything...',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: const Color(0xAA000000),
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                    suffixIcon: Transform.rotate(
                      angle: -45 * math.pi / 180,
                      child: IconButton(
                        icon: const Icon(Icons.attachment_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            if (_isTextFieldFocused)
              Container(
                width: 55.w,
                height: 55.h,
                padding: const EdgeInsets.all(5.5).w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFCACACA), width: 4.w),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF11100B),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFFEAE3D1)),
                      onPressed: _handleSendMessage,
                      iconSize: 20,
                    ),
                  ),
                ),
              )
            else
              Container(
                width: 55.w,
                height: 55.h,
                padding: const EdgeInsets.all(5.5).w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFCACACA), width: 4.w),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF11100B),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.mic_outlined,
                      color: Color(0xFFEAE3D1),
                      size: 25,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
