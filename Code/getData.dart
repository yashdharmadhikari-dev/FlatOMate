





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatomate/PopUp.dart';
import 'package:flatomate/individual_data.dart';
import 'package:flatomate/Reg.dart';
import 'package:flatomate/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flatomate/add_connections.dart';

Stream<List<User_data>>readUsers()=>FirebaseFirestore.instance.collection('users').snapshots()
.map((snapshot) => snapshot.docs.map((doc) => User_data.fromJson(doc.data())).toList());


class User_data  {
   String forUpdate='';
  final String fname;
  final String mname;
  final String lname;
  final String city;
  final int age;
  final int budget;
  final String mobile;

  User_data({required this.fname,required this.mname,required this.lname,required this.city,required this.age,required this.mobile,required this.budget});

  static User_data fromJson(Map<String,dynamic> json)=>User_data(

    fname:json['first_name'],
    mname:json['middle_name'],
    lname:json['last_name'],
    city:json['city'],
    age:json['age'],
    mobile:json['mobile'],
    budget:json['budget']

  );


}


class display_users extends StatelessWidget {
late DocumentReference x;
display_users({required this.x});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Users', style: TextStyle(
              fontSize: 30,
              fontFamily: 'NovaSquare'
          ),),
          backgroundColor: Colors.tealAccent[400],
          foregroundColor: Colors.black,
          centerTitle: true,),


        body: StreamBuilder<List<User_data>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),

              );
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )

    );
  }


  Widget buildUser(User_data user) {
    return ListTile(
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.fname}'+ ' ' + '${user.mname}' + ' ' + '${user.lname}',
              ),

            SizedBox(height: 20,),
            Text('Age: ${user.age} ',
              ),
            SizedBox(height: 20,),
            Text('Budget: ${user.budget} ',
             ),
            SizedBox(height: 20,),
            Divider(height: 2,color: Colors.white)

          ],
        ),

      //leading: CircleAvatar(child: Text(user.age),),
        //title: Text(user.fname),
        //subtitle: Text(user.city),
        onTap: () {

        },

        trailing: ElevatedButton(
            onPressed: () {
              add_conn z = add_conn(d:x);
              z.updateUser(x.id, user.fname, user.city, user.mobile);
            },
            child: Text("Connect")
        )
    );
  }

}
