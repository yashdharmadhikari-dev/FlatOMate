import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:flatomate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'Register.dart';
import 'MainPage.dart';
import 'firebase_options.dart';


class First extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Welcome to Flatomate")
        ),

        body:Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/flat.png"),
                    fit: BoxFit.cover,
              )
            ),
            child:Column(
              children: [
                //Image.asset('assets/flat.png'),
                SizedBox(height: 20,),

                Container(child: ElevatedButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginPage()),
                  );
                }, child: Text("Login",style: TextStyle(
                  fontFamily: 'NovaSquare',
                )),style: ElevatedButton.styleFrom(
                  primary: Colors.tealAccent[400],
                  onPrimary: Colors.black,
                  fixedSize: Size(150.0, 50.0),


                ),),
                  padding:EdgeInsets.all(10.0),
                  margin:EdgeInsets.all(10.0),
                ),
                Container(child: ElevatedButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const A()),
                  );
                }, child: Text("Register",style: TextStyle(
                  fontFamily: 'NovaSquare',
                ),),style: ElevatedButton.styleFrom(
                  primary: Colors.tealAccent[400],
                  onPrimary: Colors.black,
                  fixedSize: Size(150.0, 50.0),


                ),),
                  padding:EdgeInsets.all(10.0),
                  margin:EdgeInsets.all(10.0),
                ),

              ],
            )
        )
    );
  }
}
