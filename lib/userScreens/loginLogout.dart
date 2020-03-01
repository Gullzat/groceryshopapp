import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/app_tools.dart';
import 'package:grocery_delivery/userScreens/signup.dart';

class GroceryLogin extends StatefulWidget {
  @override
  _GroceryLoginState createState() => _GroceryLoginState();
}

class _GroceryLoginState extends State<GroceryLogin> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text("Логин"),
        centerTitle: false,
        elevation: 0,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[

            new SizedBox(
              height: 30,
            ),

            appTextField(
                isPassword: false,
                sidePadding: 18,
                textHint: "Почтовый адрес",
                textIcon: Icons.email,controller: email),
            new SizedBox(
              height: 30,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18,
                textHint: "Пароль",
                textIcon: Icons.lock,
                controller: password),
            appButton(
              btnTxt: "Логин",onbtnclicked: verifyLogin,
              btnPadding: 20,
              btnColor: Theme.of(context).primaryColor),
            new GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new SignUp()));
              },
              child: new Text("Новый пользователь? Зарегистрируйся здесь", style: new TextStyle(color: Colors.white),),
            )
          ],
        ),
      )
    );
  }
  verifyLogin(){
    if (email.text == ""){
      showSnackbar("Напишите почтовый адрес", scaffoldKey);
      return;
    }
    if (password.text == ""){
      showSnackbar("Напишите пароль", scaffoldKey);
      return;
    }
    displayProgressDialog(context);
  }
}
