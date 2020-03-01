import 'package:flutter/material.dart';

class GroceryDelivery extends StatefulWidget {
  @override
  _GroceryDeliveryState createState() => _GroceryDeliveryState();
}

class _GroceryDeliveryState extends State<GroceryDelivery> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Информация о доставке"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Адрес доставки",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
