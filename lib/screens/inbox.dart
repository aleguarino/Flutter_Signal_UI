import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:signal_clone/models/models.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: 'Hello World', messageType: 'receiver'),
    ChatMessage(messageContent: 'Hello', messageType: 'sender'),
    ChatMessage(messageContent: 'How are you?', messageType: 'receiver'),
    ChatMessage(messageContent: "I'm good", messageType: 'sender'),
    ChatMessage(
        messageContent: 'Are you programming?', messageType: 'receiver'),
    ChatMessage(messageContent: 'Yes', messageType: 'sender'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1EA955),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'SA',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Samuel',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  EvilIcons.user,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Ionicons.ios_videocam,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesome.phone,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Align(
                  alignment: messages[index].messageType == 'receiver'
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: messages[index].messageType == 'receiver'
                          ? Color(0xFF1EA955)
                          : Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(
                          fontSize: 13,
                          color: messages[index].messageType == 'receiver'
                              ? Colors.white
                              : Colors.black87),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  top: 10,
                ),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF1EA955),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write a message...',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      backgroundColor: Color(0xFF1EA955),
                      elevation: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
