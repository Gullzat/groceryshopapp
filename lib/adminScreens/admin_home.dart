import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery/adminScreens/add_products.dart';
import 'package:grocery_delivery/adminScreens/app_messages.dart';
import 'package:grocery_delivery/adminScreens/app_orders.dart';
import 'package:grocery_delivery/adminScreens/app_products.dart';
import 'package:grocery_delivery/adminScreens/app_users.dart';
import 'package:grocery_delivery/adminScreens/order_history.dart';
import 'package:grocery_delivery/adminScreens/privileges.dart';
import 'package:grocery_delivery/adminScreens/search.dart';
class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,//buttonColor,primaryColor
      appBar: new AppBar(
        title: new Text("Админ приложения"),
        centerTitle: true,
        elevation: 20,
      ),

//      endDrawer:new Container(width: screenSize.width-60,
//      color:Colors.white,
//        child:Column(
//          children: <Widget>[
//            new UserAccountsDrawerHeader(
//              accountName: new Text("Админ Grocery Shop"),
//              accountEmail: new Text("support@grocerydelivery.com"),
//              currentAccountPicture: new CircleAvatar(
//                backgroundColor: Colors.white,
//                child: new Icon(Icons.person),
//              ),
//            ),
//          ],
//        )
//      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Divider(),
            new SizedBox(height:40),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>AppOrders()));   //search()
                  },
                  child: new CircleAvatar(
                    maxRadius:85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.notifications),
                        new SizedBox(height:10,),
                        new Text("Заказы", textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>AppUsers()));
                  },
                  child: new CircleAvatar(
                    maxRadius:85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.people_outline),
                        new SizedBox(height:10,),
                        new Text("Пользователи", textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //new SizedBox(height:18),

//            new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                new GestureDetector(
//                  onTap:(){
//                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>AppOrders()));
//                  },
//                  child: new CircleAvatar(
//                    maxRadius:85,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        new Icon(Icons.notifications),
//                        new SizedBox(height:10,),
//                        new Text("Заказы", textAlign: TextAlign.center,),
//                      ],
//                    ),
//                  ),
//                ),
//                new GestureDetector(
//                  onTap:(){
//                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>AppMessages()));
//                  },
//                  child: new CircleAvatar(
//                    maxRadius:85,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        new Icon(Icons.chat),
//                        new SizedBox(height:10,),
//                        new Text("Сообщения", textAlign: TextAlign.center,),
//                      ],
//                    ),
//                  ),
//                ),
//              ],
//            ),
            new SizedBox(height:40),
            new Divider(),
            new SizedBox(height:40),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>AppProducts()));
                  },
                  child: new CircleAvatar(
                    maxRadius:85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.shopping_cart),
                        new SizedBox(height:10,),
                        new Text("Продукты", textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap:(){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>AddProducts()));
                  },
                  child: new CircleAvatar(
                    maxRadius:85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.add_circle_outline),
                        new SizedBox(height:10,),
                        new Text("Добавить продукт", textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(height:40),
            new Divider(),
//            new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                new GestureDetector(
//                  onTap:(){
//                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>OrderHistory()));
//                  },
//                  child: new CircleAvatar(
//                    maxRadius:85,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        new Icon(Icons.history),
//                        new SizedBox(height:10,),
//                        new Text("История заказов", textAlign: TextAlign.center,),
//                      ],
//                    ),
//                  ),
//                ),
//                new GestureDetector(
//                  onTap:(){
//                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=>Privileges()));
//                  },
//                  child: new CircleAvatar(
//                    maxRadius:85,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        new Icon(Icons.person_outline),
//                        new SizedBox(height:10,),
//                        new Text("Привилегии", textAlign: TextAlign.center,),
//                      ],
//                    ),
//                  ),
//                ),
//              ],
//            ),

          ],
        ),
      ),
    );
  }
}
