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
  double _textFieldHeight = 45.0; // Initial height
  static const double _minHeight = 45.0;
  static const double _maxHeight = 120.0; // Maximum height

  void _handleSendMessage() {
    if (widget.messageController.text.trim().isNotEmpty) {
      widget.onSendMessage(widget.messageController.text);
      // Reset height after sending message
      setState(() {
        _textFieldHeight = _minHeight;
      });
    }
  }

  void _updateTextFieldHeight() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.messageController.text,
        style: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    // Calculate available width (considering padding and suffix icon)
    final availableWidth = MediaQuery.of(context).size.width -
        5.w -
        12.w -
        55.w -
        5.w -
        48.w; // Total padding and icon widths

    textPainter.layout(maxWidth: availableWidth);

    // Calculate required height based on text content
    final lineHeight = 20.0.h; // Approximate line height
    final lines = (textPainter.height / lineHeight).ceil();
    final newHeight =
        math.max(_minHeight, math.min(_maxHeight, lines * lineHeight + 25.h));

    if (newHeight != _textFieldHeight) {
      setState(() {
        _textFieldHeight = newHeight;
      });
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

    // Listen to text changes to update height
    widget.messageController.addListener(_updateTextFieldHeight);
  }

  @override
  void dispose() {
    widget.messageController.removeListener(_updateTextFieldHeight);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate container height based on text field height
    final containerHeight = math.max(55.h, _textFieldHeight + 10.h);

    return Container(
      height: containerHeight,
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                height: _textFieldHeight,
                margin: EdgeInsets.only(bottom: 5.h),
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
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Allow unlimited lines
                  minLines: 1,
                  textAlignVertical: TextAlignVertical.top,
                  onSubmitted: (value) {
                    // Only send on Shift+Enter or when send button is pressed
                    // Regular Enter will create new line
                  },
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
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
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
            Container(
              width: 55.w,
              height: 55.h,
              margin: EdgeInsets.only(bottom: 5.h),
              padding: const EdgeInsets.all(5.5).w,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFCACACA), width: 4.w),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF11100B),
                  shape: BoxShape.circle,
                ),
                child: _isTextFieldFocused
                    ? Center(
                        child: IconButton(
                          icon:
                              const Icon(Icons.send, color: Color(0xFFEAE3D1)),
                          onPressed: _handleSendMessage,
                          iconSize: 20,
                        ),
                      )
                    : const Center(
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
