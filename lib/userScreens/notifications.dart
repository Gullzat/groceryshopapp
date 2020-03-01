import 'package:flutter/material.dart';

class GroceryNotifications extends StatefulWidget {
  @override
  _GroceryNotificationsState createState() => _GroceryNotificationsState();
}

class _GroceryNotificationsState extends State<GroceryNotifications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Уведомления"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Мои уведомления",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
