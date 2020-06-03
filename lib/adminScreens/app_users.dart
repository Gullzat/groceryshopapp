import 'package:flutter/material.dart';
class AppUsers extends StatefulWidget {
  @override
  _AppUsersState createState() => _AppUsersState();
}

class _AppUsersState extends State<AppUsers> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Пользователи"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Пользователи",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
