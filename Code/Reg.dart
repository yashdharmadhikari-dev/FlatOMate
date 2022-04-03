import 'package:flutter/material.dart';

import 'PopUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Reg{
  final String FName;
  final String MName;
  final String LName;
  final String City;
  final String gender;
  final String age;

  Alert x = Alert();
  Reg(this.FName,this.MName,this.LName,this.City,this.age,this.gender);
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'first_name': FName.toString(), // John Doe
      'middle_name': MName.toString(),
      'last_name': LName.toString(),
      'city':City,
        'age': age,
      'gender':gender// 42
    })
        //.then((value) => print("User Added"))
        .then((value) => x.for_registration(context))
        .catchError((error) => print("Failed to add user: $error"));
  }

}
