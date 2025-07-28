import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorials/commons/bottom_textfield.dart';
import 'package:tutorials/commons/my_button.dart';
import 'package:tutorials/features/authservices/auth_service.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/about_app.dart';
import 'package:tutorials/commons/custom_drawer.dart';
import 'package:tutorials/features/homescreen/mainhomescreen/presentation/search_history.dart';
import 'package:tutorials/features/authservices/get_router_response.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatOne extends StatefulWidget {
  const ChatOne({super.key});

  @override
  _ChatOneState createState() => _ChatOneState();
}

class _ChatOneState extends State<ChatOne> {
  final messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  List<Message> messages = [];
  bool isLoading = false;
  bool showWelcomeScreen = true;

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
    _scrollController.dispose();
    messageController.dispose();
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
      MaterialPageRoute(builder: (context) => SearchHistory()),
    );
  }

  // Send message function
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      showWelcomeScreen = false;
      messages.add(Message(
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      isLoading = true;
    });

    messageController.clear();
    _scrollToBottom();

    try {
      //API Call
      String aiResponse = await getOpenRouterResponse(text);

      setState(() {
        messages.add(Message(
          text: aiResponse,
          isUser: false,
          timestamp: DateTime.now(),
        ));
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        messages.add(Message(
          text: "Sorry, I couldn't process your request. Please try again.",
          isUser: false,
          timestamp: DateTime.now(),
        ));
        isLoading = false;
      });
    }

    _scrollToBottom();
  }

  // Handle suggestion button tap
  void handleSuggestionTap(String suggestionText) {
    sendMessage(suggestionText);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget buildMessageBubble(Message message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        constraints: BoxConstraints(maxWidth: 320.w, minWidth: 50.w),
        decoration: BoxDecoration(
          color: message.isUser
              ? const Color(0xFF11100B)
              : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20.r).copyWith(
            topLeft:
                message.isUser ? Radius.circular(20.r) : Radius.circular(4.r),
            topRight:
                message.isUser ? Radius.circular(4.r) : Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: IntrinsicWidth(
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isUser
                  ? const Color(0xFFEAE3D1)
                  : const Color(0xFF11100B),
              fontSize: 14.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWelcomeScreen() {
    return Stack(
      children: [
        Positioned(
          top: 100.h,
          left: 0.w,
          right: 0.w,
          child: Center(
            child: Text(
              'Hello, ${authService.value.currentUser?.email.toString()}\nHow can I help you\ntoday?',
              textAlign: TextAlign.center,
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
        // Suggestion buttons
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
                  onTap: () => handleSuggestionTap(
                      'Which universities can I go in Lagos state, Nigeria?'),
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
                  onTap: () =>
                      handleSuggestionTap('What is the cut-off mark for Jamb?'),
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
                  onTap: () => handleSuggestionTap(
                      'What is the WAEC subject combination for computer science'),
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
      ],
    );
  }

  Widget buildChatMessages() {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 16.h, bottom: 80.h),
      itemCount: messages.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == messages.length && isLoading) {
          // Show loading indicator
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20.r).copyWith(
                  topLeft: Radius.circular(4.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF11100B)),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Thinking....',
                    style: TextStyle(
                      color: const Color(0xFF11100B),
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return buildMessageBubble(messages[index]);
      },
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
                AvatarPlus(
                  'Daniel',
                  height: 35.h,
                  width: 35.w,
                ),
                SizedBox(width: 10.w),
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
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xFFEAE3D1),
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            if (showWelcomeScreen)
              Image.asset(
                'assets/images/image.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

            // Main content
            showWelcomeScreen ? buildWelcomeScreen() : buildChatMessages(),

            // Bottom text field
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: BottomTextField(
                messageController: messageController,
                focusNode: _focusNode,
                onSendMessage: sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
