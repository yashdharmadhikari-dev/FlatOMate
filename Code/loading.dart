import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flatomate/Register.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SpinKitRotatingCircle(
        color:Colors.white,

        duration: const Duration(seconds: 3),)
    );


  }
}
