// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/messages.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var messages = [
    Message('Hey there!',
        DateTime.now().subtract(Duration(days: -1, minutes: 1)), false),
    Message(
        'Hello', DateTime.now().subtract(Duration(days: -1, minutes: 1)), true),
    Message('Great see you then.',
        DateTime.now().subtract(Duration(minutes: 1)), false),
    Message('I am available at 1:00 PM.',
        DateTime.now().subtract(Duration(minutes: 1)), true),
    Message('Cool', DateTime.now().subtract(Duration(minutes: 1)), true),
    Message('Wanna hang out?', DateTime.now().subtract(Duration(minutes: 1)),
        false),
    Message('What\'s up?', DateTime.now().subtract(Duration(minutes: 1)), true),
    Message(
        'Hey', DateTime.now().subtract(Duration(days: 1, minutes: 1)), false),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Chip(
                        label: Padding(
                      padding: EdgeInsets.all(3),
                      child: Text(DateFormat.yMMMd().format(message.date)),
                    )),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(message.text),
                    ),
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
      ),
    );
  }
}
