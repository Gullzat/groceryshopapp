import 'package:flutter/material.dart';

class GroceryMessages extends StatefulWidget {
  @override
  _GroceryMessagesState createState() => _GroceryMessagesState();
}

class _GroceryMessagesState extends State<GroceryMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Сообщения"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Мои сообщения",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
