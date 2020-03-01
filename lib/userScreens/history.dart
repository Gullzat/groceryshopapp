import 'package:flutter/material.dart';

class GroceryHistory extends StatefulWidget {
  @override
  _GroceryHistoryState createState() => _GroceryHistoryState();
}

class _GroceryHistoryState extends State<GroceryHistory> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("История покупок"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("История покупок",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
