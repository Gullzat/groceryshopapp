import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/app_tools.dart';

class GroceryDelivery extends StatefulWidget {
  @override
  _GroceryDeliveryState createState() => _GroceryDeliveryState();
}

class _GroceryDeliveryState extends State<GroceryDelivery> {

  TextEditingController deliveryCityController = new TextEditingController();
  TextEditingController deliveryStreetController = new TextEditingController();
  TextEditingController deliveryHomeController = new TextEditingController();


  final scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Информация о доставке"),
        centerTitle: false,
      ),

      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(height: 30,),
            deliveryAddressTextField(textTitle: "Наименование города",
                textHint: "Введите название",
                controller: deliveryCityController),
            new SizedBox(height: 30,),
            deliveryAddressTextField(textTitle: "Название улицы,района,села",
                textHint: "Введите название",
                //textType: TextInputType.number,
                controller: deliveryStreetController),
            new SizedBox(height: 30,),
            deliveryAddressTextField(textTitle: "Номер дома,этаж",
                textHint: "Введите номер дома,этаж",
                //textType: TextInputType.number,
                controller: deliveryHomeController),
            new SizedBox(height: 30,),

            appButton(
                btnTxt: "Сохранить",
                onbtnclicked: saveAddress,
                btnPadding: 20,
                btnColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  Widget deliveryAddressTextField({String textTitle,String textHint,double height,TextEditingController controller,TextInputType textType}){
    textTitle == null ? textTitle = "Введите название " : textTitle;
    textHint == null ? textHint = "Введите название" : textHint;
    height == null ? height = 50 : height;
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(textTitle, style:new TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color:Colors.pinkAccent),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(left:10, right:10),
          child: new Container(
            height: height,
            decoration: new BoxDecoration(
                border: new Border.all(color:Colors.black26),
                borderRadius: new BorderRadius.all(new Radius.circular(4))
            ),
            child: new Padding(
              padding: const EdgeInsets.only(left:10, right:10),
              child: new TextField(
                controller: controller,
                keyboardType: textType == null ? TextInputType.text : textType,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: textHint
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


  saveAddress() {

    if (deliveryCityController.text == "") {
      showSnackbar("Введите название города", scaffoldKey);
      return;
    }
    if (deliveryStreetController.text == "") {
      showSnackbar("Введите название улицы", scaffoldKey);
      return;
    }
    if (deliveryHomeController.text == "") {
      showSnackbar("Введите номер дома,этаж", scaffoldKey);
      return;
    }

  }

}
