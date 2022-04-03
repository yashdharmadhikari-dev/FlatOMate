

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flatomate/user_details.dart';
import 'package:flutter/material.dart';

Stream<List<User_data>>readUsers()=>FirebaseFirestore.instance.collection('users').snapshots()
.map((snapshot) => snapshot.docs.map((doc) => User_data.fromJson(doc.data())).toList());


class User_data  {
  final String fname;
  final String mname;
  final String lname;
  final String city;
  final String age;

  User_data({required this.fname,required this.mname,required this.lname,required this.city,required this.age});

  static User_data fromJson(Map<String,dynamic> json)=>User_data(
    fname:json['first_name'],
    mname:json['middle_name'],
    lname:json['last_name'],
    city:json['city'],
    age:json['age']
  );
}

class display_users extends StatelessWidget {
  const display_users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Users',style: TextStyle(
              fontSize: 30,
              fontFamily: 'NovaSquare'
          ),),
          backgroundColor: Colors.tealAccent[400],
          foregroundColor: Colors.black,
          centerTitle: true,),


      body:StreamBuilder<List<User_data>>(
        stream: readUsers(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(child:Text(snapshot.error.toString()));
          }
          else if(snapshot.hasData){
            final users =snapshot.data!;

            return ListView(
              children: users.map(buildUser).toList(),
            );
          }
          else{
            return Center(child:CircularProgressIndicator());
          }

        },
      )

    );
  }
}
Widget buildUser(User_data user)=>ListTile(
  //leading: CircleAvatar(child: Text(user.age),),
  title: Text(user.fname),
  subtitle: Text(user.city),
  onTap: (){
    IndividualUserData();


  },
  trailing: ElevatedButton(
    onPressed: (){},
    child:Text("Connect")
  )
);