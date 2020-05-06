import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_delivery/tools/Store.dart';
import 'package:grocery_delivery/userScreens/notifications.dart';
import 'favorites.dart';
import 'messages.dart';
import 'basket.dart';
import 'notifications.dart';
import 'history.dart';
import 'profile.dart';
import 'delivery.dart';
import 'aboutUs.dart';
import 'login.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Grocery Shop"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.favorite,color: Colors.white,), onPressed:(){
            Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
              return new GroceryFavorites();
            }));
          }),
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.chat,color: Colors.white,), onPressed:(){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryMessages();
                } ));
              }),
              new CircleAvatar(
                radius: 9,
                backgroundColor: Colors.red,
                child: new Text("0",style: new TextStyle(color: Colors.white,),
                ),

              )
            ],
          )
        ],
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2),
                  itemCount: storeItems.length,
                  itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: Stack(
                          alignment: FractionalOffset.topRight,
                          children: <Widget>[
                            new Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[
                                new Container(
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(image:new NetworkImage(storeItems[index].itemImage))
                                  ),
                                ),
                                new Container(
                                  height: 40,
                                  color: Colors.grey.withAlpha(100),
                                  child:new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        new Text(
                                          "${storeItems[index].itemName}",    //.substring(0,5)
                                          style: new TextStyle(
                                              fontWeight:FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                        new Text(
                                          "${storeItems[index].itemWeight}",
                                          style: new TextStyle(
                                              fontWeight:FontWeight.w700,
                                              fontSize: 13,
                                          color: Colors.blueGrey),
                                        ),
                                        new Text("${storeItems[index].itemPrice} c.",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.w700
                                          ),),
                                      ],
                                    ),
                                  ) ,
                                ),
                              ],
                            ),
                            new IconButton(
                                icon: Icon(Icons.favorite_border,color: Colors.pinkAccent,), onPressed: (){})
                          ],
                        ),
                      );
                  },
                    ))
          ],
        ),
      ),
      floatingActionButton:new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed:(){
              Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                return new GroceryBasket();
              }));
            },
            child:new Icon(Icons.shopping_basket)
          ),
          new CircleAvatar(
            radius: 10,
            backgroundColor: Colors.red,
            child: new Text("0",style: new TextStyle(color: Colors.white,),
            ),

          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Гулзат Уметалиева"),
                accountEmail: new Text("gulzat.umetalieva@iaau.edu.kg"),
                currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Icon(Icons.person),
                ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.notifications,color: Colors.white,size: 20,),
              ),
              title: new Text("Уведомления"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryNotifications();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.history,color: Colors.white,size: 20,),
              ),
              title: new Text("История заказов"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryHistory();
                }));
              },
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.person,color: Colors.white,size: 20,),
              ),
              title: new Text("Настройки профиля"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryProfile();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.home,color: Colors.white,size: 20,),
              ),
              title: new Text("Адрес доставки"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryDelivery();
                }));
              },
            ),
            new Divider(),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(Icons.help,color: Colors.white,size: 20,),
              ),
              title: new Text("О нас"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryAboutUs();
                }));
              },
            ),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(Icons.exit_to_app,color: Colors.white,size: 20,),
              ),
              title: new Text("Логин"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
                  return new GroceryLogin();
                }));
              },
            ),
          ],
        ),
      )
    );
  }
}
