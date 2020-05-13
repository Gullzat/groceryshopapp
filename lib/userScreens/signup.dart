import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/app_data.dart';
import 'package:grocery_delivery/tools/app_methods.dart';
import 'package:grocery_delivery/tools/app_tools.dart';
import 'package:grocery_delivery/tools/firebase_methods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname= new TextEditingController();
  TextEditingController phoneNumber= new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController re_password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return new Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: new AppBar(
          title: new Text("Регистрация"),
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
                  textHint: "Имя Фамилия",
                  textIcon: Icons.person,
                  controller: fullname),

              new SizedBox(
                height: 30,
              ),

              appTextField(
                  isPassword: false,
                  sidePadding: 18,
                  textHint: "Номер телефона",
                  textIcon: Icons.phone,
                  textType: TextInputType.number,
                  controller: phoneNumber),

              new SizedBox(
                height: 30,
              ),
              appTextField(
                  isPassword: false,
                  sidePadding: 18,
                  textHint: "Почтовый адрес",
                  textIcon: Icons.email,
                  controller:email),
              new SizedBox(
                height: 30,
              ),
              appTextField(
                  isPassword: true,
                  sidePadding: 18,
                  textHint: "Введите пароль",
                  textIcon: Icons.lock,
                  controller: password),
              new SizedBox(
                height: 30,
              ),
              appTextField(
                  isPassword: true,
                  sidePadding: 18,
                  textHint: "Введите пароль еще раз",
                  textIcon: Icons.lock,
                  controller: re_password),

              appButton(
                  btnTxt: "Создать аккаунт",onbtnclicked: verifyDetails,
                  btnPadding: 20,
                  btnColor: Theme.of(context).primaryColor),
            ],
          ),
        )
    );
  }
  verifyDetails() async {
    if (fullname.text == ""){
      showSnackbar("Напишите Имя и Фамилию", scaffoldKey);
      return;
    }
    if (phoneNumber.text == ""){
      showSnackbar("Напишите номер телефона", scaffoldKey);
      return;
    }
    if (email.text == ""){
      showSnackbar("Напишите почтовый адрес", scaffoldKey);
      return;
    }
    if (password.text == ""){
      showSnackbar("Напишите пароль", scaffoldKey);
      return;
    }
    if (re_password.text == ""){
      showSnackbar("Нужно ввести пароль еще раз", scaffoldKey);
      return;
    }
    if (password.text != re_password.text){
      showSnackbar("Пароли несовместимы", scaffoldKey);
      return;
    }
    displayProgressDialog(context);
    String response =
    await appMethod.createUserAccount(
        fullname: fullname.text,
        phone: phoneNumber.text,
        email:email.text.toLowerCase(),
        password:password.text.toLowerCase());

    if (response == successful){
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    }
    else {
      closeProgressDialog(context);
      showSnackbar(response,scaffoldKey);
    }
  }
}
