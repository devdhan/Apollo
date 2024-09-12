import 'package:flutter/material.dart';
import 'package:tutorials/components/bottom_textfield.dart';
import 'package:tutorials/components/custom_drawer.dart';
import 'package:tutorials/pages/chat_one.dart';
import 'package:tutorials/pages/about_app.dart';

class ChatTwo extends StatefulWidget {
  ChatTwo({super.key});

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
      drawer: const CustomDrawer(),
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
              reverse: true,
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
                    padding: const EdgeInsets.fromLTRB(265, 20, 15, 0),
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
                          'How to write my exam',
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
                    padding: const EdgeInsets.fromLTRB(15, 10, 165, 100),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(20)),
                          color: Color(0xFFFFFFFF)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
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
