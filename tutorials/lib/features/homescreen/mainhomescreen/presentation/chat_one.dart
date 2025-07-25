import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/bottom_textfield.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/about_app.dart';
import 'package:tutorials/commons/custom_drawer.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/chat_two.dart';
//import 'package:tutorials/pages/search_history.dart';

class ChatOne extends StatefulWidget {
  const ChatOne({super.key});

  @override
  _ChatOneState createState() => _ChatOneState();
}

class _ChatOneState extends State<ChatOne> {
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

  // Navigate to About page
  void about(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutApp()),
    );
  }

  // Navigate to Search History
  void chatTwo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatTwo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
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
          //APPBAR
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
                  onPressed: () => chatTwo(context),
                  icon: const Icon(Icons.history),
                  color: const Color(0xFF000000),
                ),
              )
            ],
          ),
        ),
      ),
      //DRAWER
      drawer: const CustomDrawer(),
      //BODY
      backgroundColor: const Color(0xFFEAE3D1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 100.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Text(
                  'Hello, there\nHow can I help you\ntoday?',
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF11100B),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Text(
                  'Suggestions:',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
            //Suggestion buttons
            Positioned(
              top: 340.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: SizedBox(
                    height: 68.h,
                    child: MyButton(
                      onTap: () {},
                      buttonText:
                          'Which universities can I go in Lagos state, Nigeria?',
                      buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
                      buttonTextColor: const Color(0xFFEAE3D1),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 430.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: SizedBox(
                    height: 68.h,
                    child: MyButton(
                      onTap: () {},
                      buttonText: 'What is the cut-off mark for Jamb?',
                      buttoncolor: const Color(0xFF11100B),
                      buttonTextColor: const Color(0xFFEAE3D1),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 525.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: SizedBox(
                    height: 68.h,
                    child: MyButton(
                      onTap: () {},
                      buttonText:
                          'What is the WAEC subject combination for computer science',
                      buttoncolor: const Color(0xFF11100B),
                      buttonTextColor: const Color(0xFFEAE3D1),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
            //Chat Textfield
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: BottomTextField(
                messageController: messageController,
                focusNode: _focusNode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
