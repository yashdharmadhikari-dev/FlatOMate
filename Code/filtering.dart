

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'getData.dart';
import 'add_connections.dart';

//Stream<List<User_data>>readUsers()=>FirebaseFirestore.instance.collection('users').where(
    //'city', isEqualTo: "Thane").snapshots().map((snapshot) => snapshot.docs.map((doc) => User_data.fromJson(doc.data())).toList());





class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => FilterState(id: id);
  DocumentReference id;
  Filter({required this.id});
}

class FilterState extends State<Filter> {
  DocumentReference id;
  FilterState({required this.id});
  final city = TextEditingController();
  final age = TextEditingController(text: "18");

  //const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              child: TextField(


                decoration: InputDecoration(
                  //hintText: 'Filter by City',
                  labelText: 'Filter by City',
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
                controller: city,

              ),
            ),

            TextButton(onPressed: () {
              setState(() {
                city.text;
              });
            },
                child: Text("OK")),
            Text("Users in ${city.text}"),
            Divider(height: 20.0, color: Colors.yellow,),
            SingleChildScrollView(
              child: Container(
                child: StreamBuilder<List<User_data>>(
                  stream: FirebaseFirestore.instance.collection('users').where(
                      'city', isEqualTo: city.text.toUpperCase())
                      .snapshots()
                      .map((snapshot) =>
                      snapshot.docs.map((doc) => User_data.fromJson(doc.data()))
                          .toList())
                  ,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    else if (snapshot.hasData) {
                      final users = snapshot.data!;

                      return ListView(
                          children: users.map(buildUser).toList()
                      );
                    }
                    else {
                      Text("Oops");
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                height: 1000.0,


              ),
            ),

          ],
        ),
      ),
    );
  }


  Widget buildUser(User_data user) =>
      ListTile(
        //leading: CircleAvatar(child: Text(user.age),),
          title: Text(user.fname),
          subtitle: Text(user.city),

          trailing: ElevatedButton(
              onPressed: () {
                add_conn x = add_conn(d: id);
                x.updateUser("Siddhesh", user.fname, user.city, user.mobile);
              },
              child: Text("Connect")
          )
      );
}