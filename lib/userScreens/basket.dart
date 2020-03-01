import 'package:flutter/material.dart';

class GroceryBasket extends StatefulWidget {
  @override
  _GroceryBasketState createState() => _GroceryBasketState();
}

class _GroceryBasketState extends State<GroceryBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Корзина"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Моя корзина",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
