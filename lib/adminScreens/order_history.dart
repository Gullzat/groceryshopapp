import 'package:flutter/material.dart';
class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("История заказов"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Страница заказов",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
