import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/about_app.dart';
import 'package:tutorials/commons/logout_dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFEAE3D1),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 30.w),
                child: GestureDetector(
                  // onTap: () {
                  //   Navigator.pop(context);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const Profile(),
                  //     ),
                  //   );
                  // },
                  child: Row(
                    children: [
                      AvatarPlus(
                        'Daniel',
                        height: 35.h,
                        width: 35,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Recents',
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ListTile(
                  title: Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to write my exam',
                        style: TextStyle(
                          color: const Color(0xFFEAE3D1),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to write my exam',
                        style: TextStyle(
                          color: const Color(0xFFEAE3D1),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to write my exam',
                        style: TextStyle(
                          color: const Color(0xFFEAE3D1),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: ListTile(
                  title: Text(
                    'Yesterday',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to write my exam',
                        style: TextStyle(
                          color: const Color(0xFFEAE3D1),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to write my exam',
                        style: TextStyle(
                          color: const Color(0xFFEAE3D1),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0).w,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to write my exam',
                        style: TextStyle(
                          color: const Color(0xFFEAE3D1),
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
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
    );
  }
}
