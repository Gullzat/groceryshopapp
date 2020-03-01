import 'package:flutter/material.dart';

class GroceryFavorites extends StatefulWidget {
  @override
  _GroceryFavoritesState createState() => _GroceryFavoritesState();
}

class _GroceryFavoritesState extends State<GroceryFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Избранное"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Избранные продукты",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}