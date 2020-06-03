import 'package:flutter/material.dart';
class Privileges extends StatefulWidget {
  @override
  _PrivilegesState createState() => _PrivilegesState();
}

class _PrivilegesState extends State<Privileges> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Привилегии"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Страница привилегий",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
