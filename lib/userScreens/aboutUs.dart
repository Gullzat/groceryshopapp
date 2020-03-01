import 'package:flutter/material.dart';

class GroceryAboutUs extends StatefulWidget {
  @override
  _GroceryAboutUsState createState() => _GroceryAboutUsState();
}

class _GroceryAboutUsState extends State<GroceryAboutUs> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("О нас"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("О Grocery Shop",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
