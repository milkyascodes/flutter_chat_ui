// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/messages.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var messages = [
    Message('Cool', DateTime.now().subtract(Duration(minutes: 1)), true),
    Message('Wanna hang out?', DateTime.now().subtract(Duration(minutes: 1)),
        false),
    Message('What\'s up?', DateTime.now().subtract(Duration(minutes: 1)), true),
    Message('Hey', DateTime.now().subtract(Duration(minutes: 1)), false),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              elements: messages,
              groupBy: (message) => DateTime(2022),
              groupHeaderBuilder: (Message message) => SizedBox(),
              itemBuilder: (context, Message message) => Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(message.text),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Type your message here..'),
            ),
          ),
        ],
      ),
    );
  }
}
