import 'package:meta/meta.dart';

class User {
  final int index;
  final String name;

  User({
    @required this.index,
    @required this.name,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        index: json['index'],
        name: json['name'],
      );
}

class ChatUsers {
  final String name;
  final String messageText;
  final String time;

  ChatUsers({
    @required this.name,
    @required this.messageText,
    @required this.time,
  });
}

class ChatMessage {
  final String messageContent;
  final String messageType;

  ChatMessage({
    @required this.messageContent,
    @required this.messageType,
  });
}
