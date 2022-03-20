//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'Register.dart';
import 'MainPage.dart';
import 'firebase_options.dart';


Future<void> main() async  {

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );

  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) =>AuthenticationService(FirebaseAuth.instance),
      ),
      
      StreamProvider(create: (context) =>context.read<AuthenticationService>().authStateChanges, initialData: null,
      )
    ],
    child:MaterialApp( //root widget
    //themeMode:ThemeMode.dark,
    debugShowCheckedModeBanner: false,
        theme:ThemeData(
        brightness: Brightness.dark
    ),
    home:LoginPage(),
    ),
    );
  }
}


class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);
  TextEditingController userid=TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pass=TextEditingController();


  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    if (firebaseuser == null) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Flat-o-Mate",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'NovaSquare'
              ),),
            backgroundColor: Colors.tealAccent[400],
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(5.0),
                      child: Text("Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'NovaSquare',
                          )),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                CircleAvatar(
                  //backgroundImage: Image.asset('assets/WhatsApp Image 2021-11-27 at 12.04.36 AM (4).jpeg'),
                  radius: 50.0,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.tealAccent[400],
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.all(5.0),
                      child: Text("Enter Credentials",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'NovaSquare'
                          )),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'user id',
                      labelText: 'User id',
                      labelStyle: TextStyle(

                          color: Colors.white
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(),


                    ),
                    controller: userid,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(

                          color: Colors.white
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    controller: pass,
                    //key:_formKey,
                    obscureText: true,

                  ),

                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        //Login(userid.text,pass.text);
                        context.read<AuthenticationService>().signIn(
                            email: userid.text.trim(), pass: pass.text.trim());
                      },
                          child: Text("Lets go!",
                              style: TextStyle(
                                  fontFamily: 'NovaSquare'
                              )
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.tealAccent[400],
                            onPrimary: Colors.black,

                          ))
                    ]

                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("or"),
                    ]

                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text("Login with Google",
                          style: TextStyle(
                            fontFamily: 'NovaSquare',
                          )
                      ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.tealAccent[400],
                            onPrimary: Colors.black,
                          ))
                    ]

                ),
                SizedBox(height: 100,),
                Text("new here?",
                  style: TextStyle(
                      fontFamily: 'NovaSquare'),
                ),
                ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                }, child: Text("Register",
                    style: TextStyle(
                        fontFamily: 'NovaSquare'
                    )
                ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent[400],
                      onPrimary: Colors.black,
                    ))


              ],
            ),
          )
      );
    }

    else{
      return MainPage();
    }
    }

}
