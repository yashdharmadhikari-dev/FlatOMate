

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'PopUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'getData.dart';



class add_req{

  late DocumentReference d;
  late String Fname;

  add_req({required this.d,required this.Fname});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future <void> updateUser(String docName,String Conn){
    return users
        .doc(d.id)
        .update({'Req':FieldValue.arrayUnion([Conn+' wants to connect'])}).then((value) => print("Value updated"))
        .catchError((error)=>print("Error"));


  }
}
