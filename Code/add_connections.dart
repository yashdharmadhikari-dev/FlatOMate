

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'PopUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'getData.dart';



class add_conn{

late DocumentReference d;

add_conn({required this.d});

CollectionReference users = FirebaseFirestore.instance.collection('users');

 Future <void> updateUser(String docName,String Conn,String city,String Mobile){
  return users
      .doc(d.id)
      .update({'Conn':FieldValue.arrayUnion([Conn+','+city+','+Mobile])}).then((value) => print("Value updated"))
      .catchError((error)=>print("Error"));


  }
}
