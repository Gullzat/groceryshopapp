import 'package:flutter/material.dart';

class GroceryProfile extends StatefulWidget {
  @override
  _GroceryProfileState createState() => _GroceryProfileState();
}

class _GroceryProfileState extends State<GroceryProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Мой профиль"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Мой профиль",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
