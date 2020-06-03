import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/Store.dart';
class AppProducts extends StatefulWidget {
  @override
  _AppProductsState createState() => _AppProductsState();
}

class _AppProductsState extends State<AppProducts> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Продукты"),
        centerTitle: false,
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
//                          new IconButton(
//                              icon: Icon(Icons.favorite_border,color: Colors.pinkAccent,), onPressed: (){})
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
