import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/progressdialog.dart';

Widget appTextField(
    {IconData textIcon,
      String textHint,
      bool isPassword,
      double sidePadding,
      TextInputType textType,
      TextEditingController controller}){
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  //textType == null ? textType == TextInputType.text : textType;
  return Padding(
    padding: new EdgeInsets.only(left: sidePadding, right:sidePadding ),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(20)),
      ),
      child: new TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType == null ? TextInputType.text : textType,
        decoration: new InputDecoration(
            border: InputBorder.none,

            hintText: textHint,
            prefixIcon:
            textIcon == null ? new Container() : new Icon(textIcon),
        ),
      ),
    ),
  );
}

Widget appButton({String btnTxt,double btnPadding, Color btnColor,VoidCallback onbtnclicked}) {

  btnTxt == null ? btnTxt = "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor  = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.all(btnPadding),
    child: new RaisedButton(

      color: Colors.white,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.all(new Radius.circular(15))),
      onPressed: onbtnclicked,
      child: Container(
        height: 40,
        child: new Center(
          child: new Text(btnTxt,
            style: new TextStyle(color: btnColor,fontSize: 17),
          ),
        ),
      ) ,),
  );
}

showSnackbar (String message, final scaffoldKey){
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.black,
  content: new Text(
    message,
    style: new TextStyle(color: Colors.white),
  ),
  ));
}
displayProgressDialog(BuildContext context){
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder:(BuildContext context, _,__){
        return new ProgressDialog();
      }));
}

closeProgressDialog(BuildContext context){
  Navigator.of(context).pop();
}