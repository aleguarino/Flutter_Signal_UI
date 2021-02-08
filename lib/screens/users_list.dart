import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:signal_clone/models/models.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignalList(),
    );
  }
}

class SignalList extends StatefulWidget {
  final String title;

  const SignalList({Key key, this.title}) : super(key: key);
  @override
  _SignalListState createState() => _SignalListState();
}

class _SignalListState extends State<SignalList> {
  Future<List<User>> _getUsers() async {
    Iterable data = json.decode(
        (await http.get('https://jsonplaceholder.typicode.com/users')).body);
    return List<User>.from(data.map((user) => User.fromJson(user)));
  }

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() =>
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => InkWell(
                splashColor: getRandomColor(),
                child: Ink(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: getRandomColor(),
                      child: Text(snapshot.data[index].name
                          .substring(0, 2)
                          .toUpperCase()),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(
                      '${snapshot.data[index].name} is on Signal',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Feb 08')],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container(
            child: Center(child: Text('Loading..."')),
          );
        },
      ),
    );
  }
}
