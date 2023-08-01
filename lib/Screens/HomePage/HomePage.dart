import 'package:chatbot1/TextStyles.dart';
import 'package:flutter/material.dart';
import 'HomeComponents.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatMessage> _messages = [];

  TextEditingController _userText = TextEditingController();

  void _messageSubmitted(String Text) {
    setState(() {
      _messages.add(ChatMessage(text: _userText.text, isUserMessage: true));
      // adding fake reply

      _messages.add(ChatMessage(text: 'Hi iam the bot', isUserMessage: false));
      _userText.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Chat',
        style: AppTextStyles.titleStyle,
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Divider(height: 1.0),
          _MessageComposer(),
        ],
      ),
    );
  }

  Widget _MessageComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _userText,
              textInputAction: TextInputAction.send,
              onSubmitted: _messageSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _messageSubmitted(_userText.text);
                _userText.clear();
              }),
        ],
      ),
    );
  }
}
