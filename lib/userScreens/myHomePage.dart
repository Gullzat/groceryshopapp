import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:grocery_delivery/adminScreens/admin_home.dart';
import 'package:grocery_delivery/tools/Store.dart';
import 'package:grocery_delivery/tools/app_data.dart';
import 'package:grocery_delivery/tools/app_methods.dart';
import 'package:grocery_delivery/tools/app_tools.dart';
import 'package:grocery_delivery/tools/firebase_methods.dart';
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

class _MyHomePageState extends State<MyHomePage> {// with SingleTickerProviderStateMixin
  BuildContext context;
  String acctName = "";
  String acctEmail = "";
  String acctPhotoURL = "";
  bool isLoggedIn;
  AppMethods appMethods = new FirebaseMethods();
  Firestore firestore = Firestore.instance;
  //Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();

  @override
  void initState(){
    //TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser()async {
    acctName = await getStringDataLocally(key: fullName);
    acctEmail =await  getStringDataLocally(key: userEmail);
    acctPhotoURL =await  getStringDataLocally(key: photoURL);
    isLoggedIn =await getBoolDataLocally(key: loggedIN);
    acctName == null ? acctName="Гостевой пользователь":acctName;
    acctEmail == null ? acctEmail="guest@gmail.com":acctEmail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return new Scaffold(
      appBar: new AppBar(
        title: GestureDetector(
          //onLongPress: openAdmin,
          child: new Text("Grocery Shop"),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.favorite,color: Colors.white,),
              onPressed:(){
            Navigator.of(context).push(new CupertinoPageRoute(
                builder: (BuildContext context)
                {return new GroceryFavorites();}
                ));
          })
//          new Stack(
//            alignment: Alignment.topLeft,
//            children: <Widget>[
//              new IconButton(icon: new Icon(Icons.chat,color: Colors.white,), onPressed:(){
//                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
//                  return new GroceryMessages();
//                } ));
//              }),
//              new CircleAvatar(
//                radius: 9,
//                backgroundColor: Colors.red,
//                child: new Text("0",style: new TextStyle(color: Colors.white,),
//                ),
//              )
//            ],
//          )
        ],
      ),
        body: new StreamBuilder(
          stream:firestore.collection(appProducts).snapshots(),
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return new Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)));
            }
            else {
              final int dataCount = snapshot.data.documents.length;
              print("data count $dataCount");
              if(dataCount==0){
                noDataFound();
              }
              else{
                return new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,childAspectRatio: 0.8),
                  itemCount: dataCount,//storeItems.length
                  itemBuilder: (context,index){
                    final DocumentSnapshot document = snapshot.data.documents[index];
                    return buildProducts(context,index,document);        //(BuildContext context, int index)
                  },
            );
              }
            }
      }),
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
//          new CircleAvatar(
//            radius: 10,
//            backgroundColor: Colors.red,
//            child: new Text("0",style: new TextStyle(color: Colors.white,),
//            ),
//
//          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text(acctName),
                accountEmail: new Text(acctEmail),
//                currentAccountPicture: new CircleAvatar(
//                    backgroundColor: Colors.white,
//                    child: new Icon(Icons.person),
//                ),
            ),
//            new ListTile(
//              leading: new CircleAvatar(
//                child: new Icon(Icons.notifications,color: Colors.white,size: 20,),
//              ),
//              title: new Text("Уведомления"),
//              onTap: (){
//                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
//                  return new GroceryNotifications();
//                }));
//              },
//            ),
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
//            new ListTile(
//              leading: new CircleAvatar(
//                child: new Icon(Icons.person,color: Colors.white,size: 20,),
//              ),
//              title: new Text("Настройки профиля"),
//              onTap: (){
//                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) {
//                  return new GroceryProfile();
//                }));
//              },
//            ),
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
            new SizedBox(height:10),
            new Divider(),
            new SizedBox(height:10),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(Icons.exit_to_app,color: Colors.white,size: 20,),
              ),
              title: new Text(isLoggedIn == true ? "Выйти":"Логин"),
              onTap: checkIfLoggedIn,
            ),
          ],
        ),
      )
    );
  }
  checkIfLoggedIn()async{
    if (isLoggedIn == false ){
      bool response = await Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context)=>new GroceryLogin()));
      if (response == true)getCurrentUser();
      return;
    }
    bool response = await appMethods.logOutUser();
    if (response == true)getCurrentUser();
  }

  Widget noDataFound(){
    return new Container(
      child: new Center(
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.find_in_page,
                color:Colors.black87,
                size:80),
            new Text("Продукт еще недоступен",
              style: new TextStyle(color:Colors.black87,
                  fontSize: 20),),
            new SizedBox(height:30),
            new Text("Пожалуйста,повторите позже",style: new TextStyle(color:Colors.black87,
                fontSize: 20),),
          ],
        ),
      ),
    );
  }

//  openAdmin() {
//    Navigator.of(context).push(new MaterialPageRoute(
//        builder: (BuildContext context)=>new AdminHome()));
//  }


  Widget buildProducts(BuildContext context, int index, DocumentSnapshot document) {
    List prodImage = document[productImage]as List;//as List
    return new GestureDetector(
      //onTap: (){},
      child: new Card(
        child: Stack(
          alignment: FractionalOffset.topRight,//topleft
          children: <Widget>[
            new Stack(
              alignment: FractionalOffset.bottomCenter,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(fit: BoxFit.fitWidth,
                          image:new NetworkImage((prodImage[0]))) //inside NetworkImage (storeItems[index].itemImage)
                  ),
                ),
                (isLoggedIn) ? new Container(
                  height: 88,
                  child: Stack(
                    alignment: FractionalOffset.topLeft,
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(),
                      ),
                      new IconButton(icon: Icon(Icons.remove_circle_outline,color: Colors.cyan,),
                        alignment:Alignment.topLeft,iconSize:30,onPressed: (){},),
                    ],
                  ),
                ) : Container(),

                (isLoggedIn) ? new Container(
                  height: 88,
                  //color: Colors.white.withAlpha(90),
                  child: Stack(
                    alignment: FractionalOffset.topRight,
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(),
                      ),
                      new IconButton(icon: Icon(Icons.add_circle_outline,color: Colors.cyan,),alignment:Alignment.topRight,
                        iconSize:30, onPressed: (){
                          //buildProducts(context, index, document);
                          //return buildProducts(context,index,document);
//                        Navigator.of(context).push(new MaterialPageRoute(
//                            builder: (context)=>new GroceryBasket(
//                              //itemImage:storeItems[index].itemImage,
//                           )));
                        },),
                    ],
                  ),
                ) : Container(),

                new Container(
                  height: 50,
                  color: Colors.grey.withAlpha(100),

                  child:new Padding(

                    padding: const EdgeInsets.all(1.0),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "${document[productTitle]}",    //itemName.substring(0,5) and before " put ...
                          style: new TextStyle(
                              fontWeight:FontWeight.w700,
                              fontSize: 16),textAlign:TextAlign.start,
                        ),
                        //new SizedBox(height:3),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Text(
                              "${document[productWeight]}",
                              style: new TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.blueGrey),
                            ),

                            new Text(
                              "${document[productWeightType].substring(0,2)}.",
                              style: new TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize: 13,
                                  color: Colors.blueGrey),
                            ),
                            new VerticalDivider(),
                            new Text("${document[productPrice]} c.",
                              style: new TextStyle(
                                  fontWeight: FontWeight.w700
                              ),),
                          ],
                        )
                      ],
                    ),
                  ) ,
                ),
              ],
            ),
            new IconButton(
                icon: Icon(Icons.favorite_border,color: Colors.pinkAccent,),iconSize: 30, onPressed: (){ //add item to favorites
            }),
          ],
        ),
      ),
    );
  }
}
