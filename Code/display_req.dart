import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';







class Display_Requests {
  // DocumentReference f;
  late String ID;
  Display_Requests({required this.ID});
  Future<List<dynamic>> d()  => FirebaseFirestore.instance
      .collection('users').doc(ID).get()
      .then((DocumentSnapshot ds) async {
    return  await ds.get('Req');

  }
  );

}

class DisReq extends StatelessWidget {
  final List<dynamic> x;



  DisReq({required this.x});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My active Connections', style: TextStyle(
              fontSize: 30,
              fontFamily: 'NovaSquare'
          ),),
          backgroundColor: Colors.tealAccent[400],
          foregroundColor: Colors.black,
          centerTitle: true,),
        body:ListView.builder(itemCount:x.length,
            itemBuilder: (context,index){
              final item = x[index];
              return ListTile(
                  title:Text(item)
              );

            })
    );


  }
}
