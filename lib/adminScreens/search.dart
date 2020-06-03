import 'package:flutter/material.dart';
class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Поиск"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Страница поиска",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
