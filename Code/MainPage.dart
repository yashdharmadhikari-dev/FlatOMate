import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:flatomate/DevelopedBy.dart';
import 'package:flatomate/First.dart';
import 'package:flatomate/add_connections.dart';
import 'package:flatomate/display_req.dart';
import 'package:flatomate/getData.dart';
import 'package:flatomate/user_details.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filtering.dart';
import 'display_conn.dart';
import 'package:flatomate/PopUp.dart';

class MainPage extends StatelessWidget {
  late String z;
  //void sendEmail(String a)  => z=a;
MainPage({required this.z});
  //final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:Drawer(
          child:Column(
              children:[SizedBox(height: 100.0,),
                TextButton(onPressed:() async {
                  DocumentSnapshot ds = await FirebaseFirestore.instance
                      .collection('users').doc(z).get();
                  //String fname = ds.get('first_name');
                 // DocumentReference y =FirebaseFirestore.instance
                      //.collection('users').doc(z);
                 // String ID = y.id;

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  MyAccount(x: ds))
                  );
                 
                }, child: Container(child: Text("My Account")
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




        body: Container(child:
        GridView.count(
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          crossAxisCount: 2,
          children: [

               ElevatedButton( onPressed: () async  {
                DocumentReference ds = await FirebaseFirestore.instance
                    .collection('users').doc(z);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  display_users(x: ds))
                );

              },
                  child: Text("Show active users",
                  ),
                 style: ElevatedButton.styleFrom(
                   primary: Colors.amber,
                   elevation: 50.0,
                     onPrimary: Colors.black
                 )

              ),


            ElevatedButton(onPressed: ()async {
              DocumentReference ds = await FirebaseFirestore.instance
                  .collection('users').doc(z);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Filter(id:ds)));

            }, child: Text("get filtered data")),



            ElevatedButton(onPressed: () async {
              DocumentReference y =FirebaseFirestore.instance
                  .collection('users').doc(z);
              //DocumentReference y =FirebaseFirestore.instance
              //.collection('users').doc("Siddhesh");
              String ID = y.id;
              Display x = Display(ID:ID);
              List<dynamic> g = await x.d();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  DisConn(x:g))
              );


            }, child: Text("show connections")),

            ElevatedButton(onPressed: () async {
              DocumentReference y =FirebaseFirestore.instance
                  .collection('users').doc(z);
              //DocumentReference y =FirebaseFirestore.instance
              //.collection('users').doc("Siddhesh");
              String ID = y.id;
              Display_Requests x = Display_Requests(ID:ID);
              List<dynamic> g = await x.d();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  DisReq(x:g))
              );


            }, child: Text("show my requests"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    elevation: 50.0,
                    onPrimary: Colors.black
                )
            ),


            /*ElevatedButton(onPressed: () async {
              DocumentSnapshot ds = await FirebaseFirestore.instance
                  .collection('users').doc(z).get();


              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  MyAccount(x: ds))
              );


            }, child: Text("My Account"),
                style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                elevation: 50.0,
                onPrimary: Colors.black
            )),*/


            ElevatedButton(onPressed: () async {
              Alert y = Alert();
              y.flats(context);
            }
                , child: Text("show Available Flats!"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    elevation: 50.0,
                    onPrimary: Colors.black
                )        ),

            ElevatedButton(onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  Developed())
              );
            }
                , child: Text("Developed by-"),
               )
            ,



          ],
        )
        )







        /*SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(height: 200.0),
                Center(
                  child: ElevatedButton( onPressed: () async  {
                    DocumentReference ds = await FirebaseFirestore.instance
                        .collection('users').doc(z);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  display_users(x: ds))
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
                /*ElevatedButton( onPressed: () {

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
                ),*/
                ElevatedButton(onPressed: ()async {
                  DocumentReference ds = await FirebaseFirestore.instance
                      .collection('users').doc(z);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Filter(id:ds)));

                }, child: Text("get filter data")),
                ElevatedButton(onPressed: (){
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  MyAccount())
                  );*/


                }, child: Text("update")),

                ElevatedButton(onPressed: () async {
                  DocumentReference y =FirebaseFirestore.instance
                      .collection('users').doc(z);
                  //DocumentReference y =FirebaseFirestore.instance
                  //.collection('users').doc("Siddhesh");
                  String ID = y.id;
                  Display x = Display(ID:ID);
                  List<dynamic> g = await x.d();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  DisConn(x:g))
                  );


                }, child: Text("show connections")),



              ]
          ),
        )*/

    );
  }


}



/*class MainPage extends StatefulWidget {
  late CurrentUser d;
  void getz(CurrentUser b){
    d=b;
  }
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
            TextButton(onPressed:(){

            }, child: Container(child: Text("My Account")
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
      body:SingleChildScrollView(
        child: Column(
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

        }, child: Text("get filter data")),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  MyAccount())
              );


            }, child: Text("update")),

            ElevatedButton(onPressed: () async {
              Display x = Display();
              List<dynamic> z = await x.d();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  DisConn(x:z))
              );


            }, child: Text("show connections")),



          ]
        ),
      )
    );
  }


}*/




