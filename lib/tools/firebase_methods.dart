import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
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
      print (e.details);
      return errorMSG(e.details);
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
    } on PlatformException catch (e){
      print (e.details);
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

}