//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:flatomate/getData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filtering.dart';



class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 //final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        child:Column(
          children:[SizedBox(height: 100.0,),
            TextButton(onPressed:(){}, child: Container(child: Text("My Account")
            )),
            ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().SignOut();


            },
            child: Text("Log out"),
          ),
        ]),
      ),
        appBar: AppBar(
          title: Text('MainPage',style: TextStyle(
              fontSize: 30,
              fontFamily: 'NovaSquare'
          ),),
          backgroundColor: Colors.tealAccent[400],
          foregroundColor: Colors.black,
          centerTitle: true,),
      body:Column(
        children: [
          SizedBox(height: 200.0),
          Center(
            child: ElevatedButton( onPressed: () {

               Navigator.push(context,
               MaterialPageRoute(builder: (context) =>  display_users())
              );

              },
                child: Text("print firstore data"),
            style:ElevatedButton.styleFrom(
              fixedSize: Size(150.0, 150.0),
              shape: CircleBorder(

              )
            )
            ),
          ),
          SizedBox(height: 20.0,),
          ElevatedButton( onPressed: () {

    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>  display_users())
    );

    },
    child: Text("My connections"),
    style:ElevatedButton.styleFrom(
    fixedSize: Size(150.0, 150.0),
    shape: CircleBorder(

    )
    )
    ),
    ElevatedButton(onPressed: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Filter()));

      }, child: Text("get filter data"))


    ]
      )
    );
  }


}




