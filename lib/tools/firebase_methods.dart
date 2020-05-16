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
      if (user!=null){
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID,value: userInfo[userID]);
        await writeDataLocally(key: fullName,value: userInfo[fullName]);
        await writeDataLocally(key: userEmail,value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber,value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoURL,value: userInfo[photoURL]);
        await writeBoolDataLocally(key: loggedIN,value: true);



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
    //return null;
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userid)async  {
    // TODO: implement getUserInfo
    return await firestore.collection(usersData).document(userid).get();

    //return null;
  }

}