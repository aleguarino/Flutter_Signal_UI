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
