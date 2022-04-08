import 'package:flutter/material.dart';


class Developed extends StatelessWidget {
  const Developed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Developers', style: TextStyle(
            fontSize: 30,
            fontFamily: 'NovaSquare'
        ),),
        backgroundColor: Colors.tealAccent[400],
        foregroundColor: Colors.black,
        centerTitle: true,),
      body:
       Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [

           Text("Siddhesh Madkaikar,68",style:TextStyle(
             fontSize: 45.0,
             fontWeight: FontWeight.bold
           ) ,),
           SizedBox(height: 50.0,),
           Text("Yash Dharmadhikari,66",style:TextStyle(
               fontSize: 45.0,
               fontWeight: FontWeight.bold
           ) ,),
           SizedBox(height: 20.0,),
           Text("Vipul Belhekar,67",style:TextStyle(
               fontSize: 45.0,
               fontWeight: FontWeight.bold
           ) ,),
         ],
       )
    );
  }
}
