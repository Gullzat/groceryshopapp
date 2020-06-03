import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:grocery_delivery/tools/app_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_delivery/tools/app_tools.dart';
import 'app_data.dart';


class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<String> createUserAccount({String fullname, String phone, String email, String password})async {
    // TODO: implement createUserAccount
    FirebaseUser user;
    try {
      user = (await auth.createUserWithEmailAndPassword(email: email, password: password)).user;

      //

      }on PlatformException catch (e){
            //print (e.details);
            return errorMSG(e.message);
          }
      try {

      //
      if (user!=null){
        await firestore.collection(usersData).document(user.uid).setData({
          userID : user.uid,
          fullName : fullname,
          phoneNumber:phone,
          userEmail : email,
          userPassword:password
        });
        writeDataLocally(key: userID,value: user.uid);
        writeDataLocally(key: fullname,value: fullname);
        writeDataLocally(key: phoneNumber,value: phone);
        writeDataLocally(key: userEmail,value: userEmail);
        writeDataLocally(key: userPassword,value: password);
      }
    } on PlatformException catch (e){
      //print (e.details);
      return errorMSG(e.message);
    }

    return user == null ? errorMSG("Произошла ошибка") : successfulMSG();
  }

////////////////////////////////////

  @override
  Future<String> loginUser({String email, String password}) async {
    // TODO: implement loginUser

    FirebaseUser user;
    try {
      user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
      if (user!=null){
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID,value: userInfo[userID]);
        await writeDataLocally(key: fullName,value: userInfo[fullName]);
        await writeDataLocally(key: userEmail,value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber,value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoURL,value: userInfo[photoURL]);
        await writeBoolDataLocally(key: loggedIN,value: true);

        //print(userInfo[userEmail]);

      }
    } on PlatformException catch (e){
      return errorMSG(e.message);
    }

    return user == null ? errorMSG("Произошла ошибка") : successfulMSG();
  }
  Future<bool>complete()async{
    return true;
  }
  Future<bool>notComplete()async{
    return false;
  }
  Future<String>successfulMSG()async{
    return successful;
  }
  Future<String>errorMSG(String e )async{
    return e;
  }

  @override
  Future <bool> logOutUser()async {
    // TODO: implement logOutUser
    await auth.signOut();
    await clearDataLocally();

    return complete();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userid)async  {
    // TODO: implement getUserInfo
    return await firestore.collection(usersData).document(userid).get();

    //return null;
  }




  //comment

  @override
  Future<String> addNewProduct({Map newProduct})async {
    // TODO: implement addNewProduct
    String documentID;
    await firestore.collection(appProducts).add(newProduct).then((documentRef){
      documentID = documentRef.documentID;
    });
    return documentID;
  }

  @override
  Future<List<String>> uploadProductImage({List<File> imageList, String docID}) async {
    // TODO: implement uploadProductImage
    List<String> imageUrl = new List();
    try{
      for (int s=0; s<imageList.length; s++){
        StorageReference storageReference = FirebaseStorage.instance.ref().child(appProducts).child(docID+"$s.jpeg"); //child(docID) it was before last child
        StorageUploadTask uploadTask = storageReference.putFile(imageList[s]);
        StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
        String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();// this second instead
        //Uri downloadUrl = (await uploadTask.future).downloadUrl; // this was first
        imageUrl.add(downloadUrl.toString());
      }
    }on PlatformException catch (e){
      imageUrl.add(error);
      print(e.details);
    }
    return imageUrl;
  }

  @override
  Future<bool> updateProductImage({String docID, List<String> data})async {
    // TODO: implement updateProductImage
    bool msg;
    await firestore.collection(appProducts).document(docID).updateData({productImage: data}).whenComplete((){
      msg =true;
    });
    return msg;
  }

//comment

}