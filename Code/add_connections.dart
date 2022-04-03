import 'package:flutter/material.dart';

import 'PopUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_conn{
  final String name;
  Add_conn({required this.name});
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return users
        .({
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
}