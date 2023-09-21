import 'package:arbitri/components/chatgpt_answer_widget.dart';
import 'package:arbitri/components/loading_widget.dart';
import 'package:arbitri/components/text_input_widget.dart';
import 'package:arbitri/components/user_question_widget.dart';
import 'package:arbitri/pages/welcome_screen.dart';
import 'package:arbitri/theme.dart';
import 'package:flutter/material.dart';

class QuestionAnswer {
  final String question;
  String answer;

  QuestionAnswer({required this.question, required this.answer});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? answer;
  final loadingNotifier = ValueNotifier<bool>(false);
  final List<QuestionAnswer> questionAnswers = [];

  late ScrollController scrollController;
  late TextEditingController inputQuestionController;

  @override
  void initState() {
    inputQuestionController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    inputQuestionController.dispose();
    loadingNotifier.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg500Color,
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.white12,
        centerTitle: true,
        title: Text(
          "ARBITRI",
          style: kWhiteText.copyWith(fontSize: 20, fontWeight: kSemiBold),
        ),
        backgroundColor: kBg300Color,
      ),
      drawer: buildDrawer(), // Add the drawer here
      body: SafeArea(
        child: Column(
          children: [
            buildChatList(),
            TextInputWidget(
              textController: inputQuestionController,
              onSubmitted: () => _sendMessage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24), 
                  ),
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: kBg300Color,
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/arbitri.png')),
                  ),
                ),
                buildDrawerItem(
                  icon: Icons.home,
                  title: 'Home',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.search,
                  title: 'Search Laws',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.upload_file,
                  title: 'Upload Documents',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.call,
                  title: 'Talk With Expert',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.filter,
                  title: 'Plans',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.quiz,
                  title: 'Get In Quiz',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.people_outline_outlined,
                  title: 'About Us',
                  routeName: '/welcome_screen'
                ),
                buildDrawerItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  routeName: '/welcome_screen'
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Have an Issue ? ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    " Contact Us",
                    style: TextStyle(
                      color: Color(0xFF35C2C1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildDrawerItem({
  //   required IconData icon,
  //   required String title,
  // }) {
  //   return ListTile(
  //     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  //     leading: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(
  //           icon,
  //           color: Colors.grey, // Set the icon color to grey
  //           size: 18.0, // Set a fixed icon size
  //         ),
  //         SizedBox(width: 12.0), // Add spacing between icon and text
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 18,
  //           ),
  //         ),
  //       ],
  //     ),
  //     onTap: () {
  //       // Navigate to the respective screen or perform any other action.
  //       Navigator.pushReplacementNamed(context, '/login_screen.dart');// Close the drawer
  //     },
  //   );
  // }
  Widget buildDrawerItem({
  required IconData icon,
  required String title,
  required String routeName, // Add routeName parameter
}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 18.0,
        ),
        SizedBox(width: 12.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    ),
    onTap: () {
      // Use the Navigator to navigate to the specified route
      Navigator.pushReplacementNamed(context, routeName);
    },
  );
}


  Expanded buildChatList() {
    return Expanded(
      child: ListView.separated(
        controller: scrollController,
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 16),
        itemCount: questionAnswers.length,
        itemBuilder: (BuildContext context, int index) {
          final question = questionAnswers[index].question;
          final answer = questionAnswers[index].answer;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserQuestionWidget(question: question),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: loadingNotifier,
                builder: (_, bool isLoading, __) {
                  if (answer.isEmpty && isLoading) {
                    _scrollToBottom();
                    return const LoadingWidget();
                  } else {
                    return ChatGptAnswerWidget(
                      answer: answer.toString().trim(),
                    );
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  void _sendMessage() async {
    final question = inputQuestionController.text;
    inputQuestionController.clear();
    loadingNotifier.value = true;

    setState(() =>
        questionAnswers.add(QuestionAnswer(question: question, answer: "")));

    // Simulate a response from the API (remove this in the real implementation)
    Future.delayed(const Duration(seconds: 2), () {
      final simulatedAnswer = "Simulated response for: $question";
      setState(() {
        questionAnswers.last.answer = simulatedAnswer;
        loadingNotifier.value = false;
        _scrollToBottom();
      });
    });
  }
}
