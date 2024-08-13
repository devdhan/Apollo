import 'package:flutter/material.dart';
import 'package:tutorials/pages/about_app.dart';
import 'package:tutorials/pages/search_history.dart';
import 'dart:math' as math;
import 'package:tutorials/components/logout_dialog.dart';

class ChatOne extends StatelessWidget {
  ChatOne({super.key});

  final messageController = TextEditingController();

  // Navigate to About page
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
      MaterialPageRoute(builder: (context) => const SearchHistory()),
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
                  onPressed: () => searchHistory(context),
                  icon: const Icon(Icons.history),
                  color: const Color(0xFF000000),
                ),
              )
            ],
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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0),
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
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 300.0),
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
            ),
            Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
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
                            letterSpacing: -0.41,
                          ),
                          suffixIcon: Transform.rotate(
                            angle: -45 * math.pi / 180,
                            child: const Icon(Icons.attachment_outlined),
                          ),
                          iconColor: const Color(0xFFCACACA),
                          focusColor: const Color(0xFFCACACA),
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
    );
  }
}
