import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_delivery/tools/app_data.dart';
import 'package:grocery_delivery/tools/app_methods.dart';
import 'package:grocery_delivery/tools/app_tools.dart';
import 'package:grocery_delivery/tools/firebase_methods.dart';
import 'package:image_picker/image_picker.dart';
class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  List<DropdownMenuItem<String>> dropDownWeights;
  String selectedWeight;
  List<String> weightList = new List();

  List<DropdownMenuItem<String>> dropDownCategories;
  String selectedCategory;
  List<String> categoryList = new List();

  //add single image
  //Future<File> imageFile;
  //add single image

  Map<int, File> imagesMap = new Map();

  TextEditingController productTitleController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();
  TextEditingController productWeightController = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //add image from gallery or camera appears page
  //File imageFile;
//add image from gallery

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightList = new List.from(localWeights);
    categoryList = new List.from(localCategories);
    dropDownWeights = buildAndGetDropDownItems(weightList);
    dropDownCategories = buildAndGetDropDownItems(categoryList);
    selectedWeight = dropDownWeights[0].value;
    selectedCategory = dropDownCategories[0].value;
  }

  //add image from gallery
//  Widget imageView(){
//    if(imageFile != null){
//      Image.file(imageFile,width:150,height:150);
//      //showSnackar("Добавьте фото продукта", scaffoldKey);
//      //return;
//    }
//
//  }
  //add image from gallery


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme
          .of(context)
          .dialogBackgroundColor,
      appBar: new AppBar(
        title: new Text("Добавить продукт"),
        centerTitle: false,
        elevation: 30,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new RaisedButton.icon(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(15))),
                onPressed: (){pickImage();}, //add image part,was null//instead write pickerImage(ImageSource.gallery)
                icon: Icon(Icons.add_photo_alternate, color: Colors.indigo,),
                label: new Text("Фото",
                  style: new TextStyle(fontSize: 15, color: Colors.black87),)),
          )
        ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(height: 30,),

//add from gallery
            //imageView(),
//add from gallery

//add image part multiimage

            MultiImagePickerList(
                imageList:imageList,
                removeNewImage:(index){
                  removeImage(index);
                }),

//add image part multiimage finish


            new SizedBox(height: 30,),
            productTextField(textTitle: "Наименование продукта",
                textHint: "Введите название",
                controller: productTitleController),
            new SizedBox(height: 30,),
            productTextField(textTitle: "Цена продукта",
                textHint: "Введите стоимость",
                textType: TextInputType.number,
                controller: productPriceController),
            new SizedBox(height: 30,),
            productTextField(textTitle: "Количество/Вес в граммах",
                textHint: "Введите количество или вес продукта",
                textType: TextInputType.number,
                controller: productWeightController),
            new SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                productDropDown(textTitle: "Кол./вес",
                    selectedItem: selectedWeight,
                    dropDownItems: dropDownWeights,
                    changedDropDownItems: changedDropDownWeight),
                productDropDown(textTitle: "Категория продукта",
                    selectedItem: selectedCategory,
                    dropDownItems: dropDownCategories,
                    changedDropDownItems: changedDropDownCategory),
              ],
            ),
            new SizedBox(height: 20,),
            appButton(
                btnTxt: "Добавить",
                onbtnclicked: addNewProducts,
                btnPadding: 20,
                btnColor: Theme
                    .of(context)
                    .primaryColor),
          ],
        ),
      ),
    );
  }

  void changedDropDownWeight(String selectedSize) {
    setState(() {
      selectedWeight = selectedSize;
      print(selectedSize);
    });
  }

  void changedDropDownCategory(String selectedSize) {
    setState(() {
      selectedCategory = selectedSize;
      print(selectedSize);
    });
  }



  //add image part


  //add image from gallery
//  pickImage(BuildContext context)async{
//    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
//    this.setState((){
//      imageFile = picture;
//    });

//   imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//   this.setState((){
//
//   });
//
//    Navigator.of(context).pop();
//  }
  //add image from gallery




  //pickimage for one photo

//  //pickerImage(ImageSource source){
//  //imageFile = ImagePicker.pickImage(source: source);
//  // }

  //pickimage for one photo



  List<File> imageList;

  pickImage() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file != null){
      //imagesMap[imagesMap.length]=file;
      List<File> imageFile= new List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (imageList == null) {
        imageList = new List.from(imageFile, growable: true);//true

      }
      else {
        for (int s=0; s<imageFile.length; s++){
          imageList.add(file);
        }
      }
    setState(() {});
  }
}
  removeImage(int index)async{
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState((){});
  }


  //add image part

  AppMethods appMethod = new FirebaseMethods();

  addNewProducts() async{

    //add image part

    if (imageList == null || imageList.isEmpty){
      showSnackbar("Добавьте фото продукта", scaffoldKey);
      return;
    }

  //add image part


    if (productTitleController.text == "") {
      showSnackbar("Введите наименование продукта", scaffoldKey);
      return;
    }
    if (productPriceController.text == "") {
      showSnackbar("Введите стоимость продукта", scaffoldKey);
      return;
    }
    if (productWeightController.text == "") {
      showSnackbar("Введите количество/массу продукта", scaffoldKey);
      return;
    }
    if (selectedWeight == "Выберите:") {
      showSnackbar("Выберите количество/массу продукта", scaffoldKey);
      return;
    }
    if (selectedCategory == "Выберите:") {
      showSnackbar("Выберите категорию продукта", scaffoldKey);
      return;
    }
    //comment
    displayProgressDialog(context);

    Map<String, dynamic> newProduct = {
      productTitle: productTitleController.text,
      productPrice:productPriceController.text,
      productWeight:productWeightController.text,
      productWeightType:selectedWeight,
      productCategory:selectedCategory,
    };

    //add info to Firebase
    String productID = await appMethod.addNewProduct(newProduct: newProduct);

    //upload to Firebase
    List<String> imageURL= await appMethod.uploadProductImage(docID: productID, imageList: imageList);

    //check errors when adding to firebase
    if(imageURL.contains(error)){
      closeProgressDialog(context);
      showSnackbar("Фото не загружено",scaffoldKey);
      return;
    }
    //update info after upload image to storage
    bool result = await appMethod.updateProductImage(docID: productID, data: imageURL);

    if(result!=null && result == true){
      closeProgressDialog(context);
      resetEverything();
      showSnackbar("Вы добавили новый продукт", scaffoldKey);
    }else{
      closeProgressDialog(context);
      showSnackbar("Новый продукт не добавлен", scaffoldKey);
    }

//comment
  }

  void resetEverything() {
    imageList.clear();
    productTitleController.text ="";
    productPriceController.text ="";
    productWeightController.text ="";
    selectedCategory = "Выберите:";
    selectedWeight ="Выберите:";
    setState(() {

    });
  }
}