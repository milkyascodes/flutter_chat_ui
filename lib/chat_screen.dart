// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

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
  bool isToday(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    return diff == 0 && now.day == date.day;
  }

  List<Message> messages = [
    Message('Hey there!',
        DateTime.now().subtract(Duration(days: 0, minutes: 1)), false),
    Message(
        'Hello', DateTime.now().subtract(Duration(days: 0, minutes: 1)), true),
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
                reverse: true,
                order: GroupedListOrder.DESC,
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
                        backgroundColor: Colors.transparent,
                        elevation: 1,
                        label: Padding(
                            padding: EdgeInsets.all(3),
                            child: isToday(message.date)
                                ? Text('Today')
                                : Text(
                                    DateFormat.yMMMd().format(message.date)))),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // width: 300,
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              // focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                              hintText: 'Type your message here..'),
                          onSubmitted: (text) {
                            final newMessage =
                                Message(text, DateTime.now(), true);
                            setState(() {
                              messages.add(newMessage);
                            });
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                      iconSize: 30,
                      splashRadius: 10,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}


// onPressed:(text) {
//   final newMessage = Message(text, DateTime.now(), true);
//   setState(() {
//     messages.add(newMessage);
//   });
// };