import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatomate/getData.dart';



class MyAccount extends StatelessWidget {

  //late String x;
  //String first_name='';
  final DocumentSnapshot x;

  /*Future<Object?> getData() {
    return FirebaseFirestore.instance
        .collection('users').doc(x).get()
        .then(((DocumentSnapshot ds) {
      if (ds.exists) {
        ds.data();
      }
    })
    );
  }*/


  MyAccount({required this.x});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body:ListTile(
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${x.get('first_name')} '+ ' ' + '${x.get('middle_name')}' + ' ' + '${x.get('last_name')}',
              style: TextStyle(
                fontFamily: 'NovaSquare',
                fontSize: 25,
              ),),
              SizedBox(height: 20,),
              Text('Mobile: ${x.get('mobile')} ',
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 25,
                ),

              ),
              SizedBox(height: 20,),
              Text('Age: ${x.get('age')} ',
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 25,
                ),),
              SizedBox(height: 20,),
              Text('Email: ${x.get('email')} ',
                style: TextStyle(
                  fontFamily: 'NovaSquare',
                  fontSize: 25,
                ),)

            ],
          )
        )

    );
  }
}


