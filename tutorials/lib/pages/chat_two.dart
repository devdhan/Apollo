import 'package:flutter/material.dart';
import 'package:tutorials/components/logout_dialog.dart';
import 'package:tutorials/pages/chat_one.dart';
import 'package:tutorials/pages/about_app.dart';
import 'dart:math' as math;

class ChatTwo extends StatelessWidget {
  ChatTwo({super.key});

  final messageController = TextEditingController();

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
      MaterialPageRoute(builder: (context) => ChatOne()),
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
                Image.asset(
                  'assets/blankcircle.png',
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'APOLLO ChatBox',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
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
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFEAE3D1),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 30.0),
                  child: Text(
                    'Recents',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: ListTile(
                    title: Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => about(context),
                        child: SizedBox(
                          width: 250,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'About',
                                style: TextStyle(
                                  color: Color(0xFFEAE3D1),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextButton(
                          onPressed: () => showLogoutDialog(context),
                          child: SizedBox(
                            width: 250,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Color(0xFFEAE3D1),
                                    fontSize: 12,
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
      backgroundColor: const Color.fromRGBO(234, 227, 209, 1),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Scrollable content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        'Ask me anything',
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            color: Color(0xA4000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(165, 20, 15, 0),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(30)),
                          color: Color(0xFF11100B)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 10.0),
                        child: Text(
                          'Explain the theory of evolution in details and give various examples',
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                  // Chat icon
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/blankcircle.png',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 165, 0),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(20)),
                          color: Color(0xFFFFFFFF)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 10.0),
                        child: Text(
                          'To write your exam effectively, start by preparing thoroughly with regular study and practice of past papers. Ensure you understand the exam format and gather all necessary materials. On exam day, manage your time by reading instructions carefully, starting with easier questions, and allocating time for each section. Use elimination for multiple choice questions, be concise in short answers, and outline essays before writing. Review your work for errors, completeness, and clarity. For objective exams, read all options; for subjective exams, support arguments with evidence; for problem-solving exams, show all work and double-check calculations. Post-exam, reflect on your performance to improve for next time.',
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000)),
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
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
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
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.rotate(
                          angle: -45 * math.pi / 180,
                          child: const Icon(Icons.attachment_outlined),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Color(0xFF11100B),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.mic_outlined,
                              color: Color(0xFFEAE3D1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
