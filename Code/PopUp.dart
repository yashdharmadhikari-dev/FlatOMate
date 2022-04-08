import 'package:flatomate/MainPage.dart';
import 'package:flatomate/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flatomate/main.dart';

class Alert {


  Future<dynamic> for_registration(BuildContext context, String x) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Registered"),
          content: Text("New User Registered,please Login again to continue!"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()),

            );
          }, child: Text("Okay"))
          ],

        )
    );
  }

  Future<dynamic> for_Login_success(BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Successful"),
          content: Text("Login Successful"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
          ],

        )
    );
  }

  Future<dynamic> for_Login_fail(BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Invalid"),
          content: Text("Login Unsuccesful,check credentials"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
          ],

        )
    );
  }

    Future<dynamic> for_Login_error(BuildContext context) {
      return showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text("Invalid"),
            content: Text("Please Enter all details"),
            actions: [TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Okay"))
            ],

          )
      );
    }
  Future<dynamic>  forRegisterError (BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Invalid"),
          content: Text("Please fill all fields"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
          ],

        )
    );
  }

  Future<dynamic>  forConnectionAdd (BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Added"),
          content: Text("Connection Added to list Succesfully!"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
          ],

        )
    );
  }

  Future<dynamic>  flats (BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Unavailable"),
          content: Text("Feature not currently available"),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Okay"))
          ],

        )
    );
  }

  }
