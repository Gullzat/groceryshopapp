import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/app_data.dart';
import 'package:grocery_delivery/tools/app_tools.dart';

class GroceryBasket extends StatefulWidget {
  @override
  _GroceryBasketState createState() => _GroceryBasketState();
}

class _GroceryBasketState extends State<GroceryBasket> {
  List<DropdownMenuItem<String>> dropDownPayment;
  String selectedPayment;
  List<String> paymentList = new List();

  TextEditingController deliveryCityController = new TextEditingController();
  TextEditingController deliveryStreetController = new TextEditingController();
  TextEditingController deliveryHomeController = new TextEditingController();
  TextEditingController deliveryTimeController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    paymentList = new List.from(localPayments);
    dropDownPayment = buildAndGetDropDownItems(paymentList);
    selectedPayment = dropDownPayment[0].value;
  }

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Корзина"),
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
//            new SizedBox(height: 30,),
//            deliveryAddressTextField(textTitle: "Удобное для вас время доставки ",
//                textHint: "Укажите время",
//                textType: TextInputType.datetime,
//                controller: deliveryTimeController),
            new SizedBox(height: 30,),
            productDropDown(textTitle: "Выберите тип оплаты:",
                selectedItem: selectedPayment,
                dropDownItems: dropDownPayment,
                changedDropDownItems: changedDropDownPayment),
            new SizedBox(height: 30,),
            appButton(
                btnTxt: "Отправить",
                onbtnclicked: submitOrder,
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


  submitOrder() {

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
    if (deliveryTimeController.text == "") {
      showSnackbar("Введите удобное время для доставки", scaffoldKey);
      return;
    }
    if (selectedPayment == "выберите:") {
      showSnackbar("Введите тип оплаты ", scaffoldKey);
      return;
    }

  }

  void changedDropDownPayment(String selectedSize) {
    setState(() {
      selectedPayment = selectedSize;
      print(selectedSize);
    });
  }


}
