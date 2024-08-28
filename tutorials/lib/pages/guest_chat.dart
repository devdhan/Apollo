import 'package:flutter/material.dart';
import 'package:tutorials/components/logout_dialog.dart';
import 'package:tutorials/components/my_button.dart';
import 'package:tutorials/pages/about_app.dart';
import 'dart:math' as math;

class GuestChat extends StatefulWidget {
  const GuestChat({super.key});

  @override
  _GuestChatState createState() => _GuestChatState();
}

class _GuestChatState extends State<GuestChat> {
  final messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;

  @override
  void initState() {
    super.initState();
    // Add a listener to the FocusNode
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the FocusNode when the widget is removed
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
                  padding: EdgeInsets.only(top: 100, left: 30.0),
                  child: Text(
                    'Guest Mode',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Log in or sign up to \nsee recent search',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
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
      // BODY
      backgroundColor: const Color.fromRGBO(234, 227, 209, 1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Positioned(
              top: 100.0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hello, there\nHow can I help you\ntoday?',
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF11100B),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 300.0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Suggestions:',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            // Suggestion buttons
            Positioned(
              top: 340.0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MyButton(
                    onTap: () {},
                    buttonText: 'Can you explain the theory of evolution?',
                    buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
                    buttonTextColor: const Color(0xFFEAE3D1),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 410.0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MyButton(
                    onTap: () {},
                    buttonText: 'How do you solve quadratic equations?',
                    buttoncolor: const Color.fromRGBO(17, 16, 11, 1),
                    buttonTextColor: const Color(0xFFEAE3D1),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 480.0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MyButton(
                    onTap: () {},
                    buttonText: 'What are Newton’s three laws of motion?',
                    buttoncolor: const Color(0xFF11100B),
                    buttonTextColor: const Color(0xFFEAE3D1),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            // BOTTOM TEXTFIELD
            Positioned(
              bottom: 0,
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
                    focusNode: _focusNode,
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
                            child: IconButton(
                              icon: const Icon(Icons.attachment_outlined,
                                  color: Color(0xFFCACACA)),
                              onPressed: () {},
                            ),
                          ),
                          //on focused the text field is too width adjust asap
                          if (_isTextFieldFocused)
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFCACACA), width: 5),
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF11100B),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(Icons.send,
                                        color: Color(0xFFEAE3D1)),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFCACACA), width: 5),
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
