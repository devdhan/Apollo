import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/bottom_textfield.dart';
import 'package:tutorials/commons/custom_drawer.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_one.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/about_app.dart';

class ChatTwo extends StatefulWidget {
  const ChatTwo({super.key});

  @override
  _ChatTwoState createState() => _ChatTwoState();
}

class _ChatTwoState extends State<ChatTwo> {
  final messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void about(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutApp()),
    );
  }

  // Navigate to Search History
  void searchHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatOne()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 4),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEAE3D1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 6,
                offset: const Offset(0, 0.5),
              ),
            ],
          ),
          // APPBAR
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AvatarPlus(
                  'Daniel',
                  height: 35.h,
                  width: 35.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'APOLLO ChatBox',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.history),
                  color: const Color(0xFF000000),
                ),
              )
            ],
          ),
        ),
      ),
      // DRAWER
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFEAE3D1),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Scrollable content
          Positioned.fill(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Center(
                      child: Text(
                        'Ask me anything',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Montserrat',
                            color: const Color(0xA4000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(265, 20, 15, 0).w,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(20.r),
                              bottomLeft: Radius.circular(30.r)),
                          color: const Color(0xFF11100B)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10.h),
                        child: Text(
                          'How to write my exam',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                  // Chat icon
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        AvatarPlus(
                          'Chatbot',
                          height: 35.h,
                          width: 35.w,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 165, 100).w,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r),
                              bottomLeft: Radius.circular(20.r)),
                          color: const Color(0xFFFFFFFF)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Text(
                          'To write your exam effectively, start by preparing thoroughly with regular study and practice of past papers. Ensure you understand the exam format and gather all necessary materials. On exam day, manage your time by reading instructions carefully, starting with easier questions, and allocating time for each section. Use elimination for multiple choice questions, be concise in short answers, and outline essays before writing. Review your work for errors, completeness, and clarity. For objective exams, read all options; for subjective exams, support arguments with evidence; for problem-solving exams, show all work and double-check calculations. Post-exam, reflect on your performance to improve for next time.',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF000000)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom textfield
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomTextField(
              messageController: messageController,
              focusNode: _focusNode,
            ),
          ),
        ],
      ),
    );
  }
}
