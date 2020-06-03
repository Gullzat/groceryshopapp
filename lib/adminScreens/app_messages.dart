import 'package:flutter/material.dart';
class AppMessages extends StatefulWidget {
  @override
  _AppMessagesState createState() => _AppMessagesState();
}

class _AppMessagesState extends State<AppMessages> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Сообщения"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Страница отзывов",style: new TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
