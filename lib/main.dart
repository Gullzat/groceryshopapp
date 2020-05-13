import 'package:flutter/material.dart';

import 'userScreens/myHomePage.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Grocery Shop',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: MyHomePage( ),
    );
  }
}
