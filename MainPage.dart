import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('MainPage',style: TextStyle(
        fontSize: 30,
        fontFamily: 'NovaSquare'
    ),),
    backgroundColor: Colors.tealAccent[400],
    foregroundColor: Colors.black,
    centerTitle: true,),

    body: ElevatedButton(
        child:Text("Log out"),
    onPressed: (){
          context.read<AuthenticationService>().SignOut();
    },

    ),
    );
}
}
