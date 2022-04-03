import 'package:flatomate/MainPage.dart';
import 'package:flutter/material.dart';

class Alert  {



  Future<dynamic> for_registration(BuildContext context) {
    return showDialog(context:  context, builder:(context) =>AlertDialog(
      title: Text("Registered"),
      content: Text("New User Registered"),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  MainPage()),

        );


        }, child: Text("Okay"))],

    )
    );
  }

  Future<dynamic> for_Login_success(BuildContext context) {
    return showDialog(context:  context, builder:(context) =>AlertDialog(
      title: Text("Successful"),
      content: Text("Login Successful"),
      actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Okay"))],

    )
    );
  }

  Future<dynamic> for_Login_fail(BuildContext context) {
    return showDialog(context:  context, builder:(context) =>AlertDialog(
      title: Text("Invalid"),
      content: Text("Login Unsuccesful,check credentials"),
      actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Okay"))],

    )
    );
  }
}
