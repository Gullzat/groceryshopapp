import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/progressdialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
Widget appTextField(
    {IconData textIcon,
      String textHint,
      bool isPassword,
      double sidePadding,
      TextInputType textType,
      TextEditingController controller}){
  sidePadding == null ? sidePadding = 0.0 :sidePadding;
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

Widget productTextField({String textTitle,String textHint,double height,TextEditingController controller,TextInputType textType}){
  textTitle == null ? textTitle = "Введите название продукта " : textTitle;
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


Widget productDropDown({String textTitle, String selectedItem, List<DropdownMenuItem<String>>dropDownItems,
  ValueChanged<String> changedDropDownItems}){
  textTitle == null ? textTitle = "Выберите количество/вес продукта " : textTitle;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(textTitle, style:new TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color:Colors.pinkAccent),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left:10, right:15),
        child: Container(
          decoration: new BoxDecoration(
              border: new Border.all(color:Colors.black26),
              borderRadius: new BorderRadius.all(new Radius.circular(4))
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:5, right: 3),
            child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                    value: selectedItem,
                    items: dropDownItems,
                    onChanged: changedDropDownItems)),
          ),
        ),
      ),
    ],
  );
}


//add image part



Widget MultiImagePickerMap({Map<int, File> imageList,
  VoidCallback addNewImage(int position),
  VoidCallback removeNewImage(int position)}) {
  int imageLength = imageList.isEmpty ? 1 : imageList.length + 1;
  bool isNull = imageList.isEmpty ? true : false;


  print("image length $imageLength");


  return new Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: new SizedBox(
      height: 150,
      child: new ListView.builder(
          itemCount: imageLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return imageList.isEmpty || imageList[index] == null ? new Padding(
              padding: new EdgeInsets.only(left: 3, right: 3),
              child: new GestureDetector(
                onTap: () {
                  addNewImage(index);
                },
                child: new Container(
                  width: 150,
                  height: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.image,
                        size: 150,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),
                      new Icon(
                        Icons.add_circle_outline,
                        size: 25,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(15)),
                  ),
                ),
              ),
            )
                : new Padding(
              padding: new EdgeInsets.only(left: 3, right: 3),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150,
                    height: 150,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15)),
                        image: new DecorationImage(fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(Icons.clear, color: Colors.white,),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? new Container()
        : new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

//Widget buildImages({int index, Map imagesMap}) {
//  return imagesMap.isEmpty
//      ? new Container(
//    width: 150.0,
//    height: 150.0,
//    child: Stack(
//      alignment: Alignment.center,
//      children: <Widget>[
//        new Icon(
//          Icons.image,
//          size: 100.0,
//          color: Colors.white,
//        ),
//        new Icon(
//          Icons.add_circle,
//          color: Colors.grey,
//        ),
//      ],
//    ),
//    decoration: new BoxDecoration(
//      color: Colors.grey.withAlpha(100),
//    ),
//  )
//      : imagesMap[index] != null
//      ? new Container(
//    width: 150.0,
//    height: 150.0,
//    decoration: new BoxDecoration(
//        color: Colors.grey.withAlpha(100),
//        image: new DecorationImage(
//            fit: BoxFit.cover,
//            image: new FileImage(imagesMap[index]))),
//  )
//      : new Container(
//    width: 150.0,
//    height: 150.0,
//    child: Stack(
//      alignment: Alignment.center,
//      children: <Widget>[
//        new Icon(
//          Icons.image,
//          size: 100.0,
//          color: Colors.white,
//        ),
//        new Icon(
//          Icons.add_circle,
//          color: Colors.grey,
//        ),
//      ],
//    ),
//    decoration: new BoxDecoration(
//      color: Colors.grey.withAlpha(100),
//    ),
//  );
//}





//add image part finish




List<DropdownMenuItem<String>>buildAndGetDropDownItems(List weight){
  List<DropdownMenuItem<String>> items = new List();
  for (String weight in weight){
    items.add(new DropdownMenuItem(value: weight,child: new Text(weight)));
  }
  return items;
}


showSnackbar (String message, final scaffoldKey){
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.black,
    content: new Text(message, style: new TextStyle(color: Colors.white),),
  ));
}

displayProgressDialog(BuildContext context){
  Navigator.of(context).push(new PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) {
      return new ProgressDialog();
    }));
}
closeProgressDialog (BuildContext context){
  Navigator.of(context).pop();
}

writeDataLocally({String key, String value})async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolDataLocally({String key, bool value})async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getDataLocally({String key})async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

getStringDataLocally({String key})async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getString(key);
}

getBoolDataLocally({String key})async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key)==null ?false:localData.getBool(key);
}

clearDataLocally()async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}