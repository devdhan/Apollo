import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/logout_dialog.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/about_app.dart';
import 'package:tutorials/commons/bottom_textfield.dart';

class GuestChat extends StatefulWidget {
  const GuestChat({super.key});

  @override
  _GuestChatState createState() => _GuestChatState();
}

class _GuestChatState extends State<GuestChat> {
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
                Image.asset(
                  'assets/blankcircle.png',
                ),
                SizedBox(
                  width: 15.w,
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
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFEAE3D1),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100.h, left: 30.w),
                  child: Text(
                    'Guest Mode',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    'Log in or sign up to \nsee recent search',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutApp(),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 250.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'About',
                                style: TextStyle(
                                  color: const Color(0xFFEAE3D1),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: TextButton(
                          onPressed: () => showLogoutDialog(context),
                          child: SizedBox(
                            width: 250.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: const Color(0xFFEAE3D1),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFEAE3D1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/image.png',
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
                      buttoncolor: const Color(0xFF11100B),
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
            //BottomTextField widget
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
