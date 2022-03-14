// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var message = [
    Message('text', DateTime.now().subtract(Duration(minutes: 1)), false),
    Message('text', DateTime.now().subtract(Duration(minutes: 1)), true),
    Message('text', DateTime.now().subtract(Duration(minutes: 1)), false),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(),
          ],
        ),
      ),
    );
  }
}
