import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomTextField extends StatefulWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;

  const BottomTextField({
    super.key,
    required this.messageController,
    required this.focusNode,
  });

  @override
  _BottomTextFieldState createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends State<BottomTextField> {
  late bool _isTextFieldFocused;

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
      height: 55,
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
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(
                  color: Color(0xAA000000),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.41,
                ),
                controller: widget.messageController,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _isTextFieldFocused
                      ? const Color(0xFFE6E6E6)
                      : Colors.transparent,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE6E6E6)),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Ask anything...',
                  hintStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xAA000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
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
            if (_isTextFieldFocused)
              Container(
                padding: const EdgeInsets.all(5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCACACA), width: 4),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF11100B),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFFEAE3D1)),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.all(5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCACACA), width: 4),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF11100B),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.mic_outlined,
                      color: Color(0xFFEAE3D1),
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
