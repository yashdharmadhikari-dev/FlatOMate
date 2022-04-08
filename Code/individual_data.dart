import 'package:flutter/material.dart';

class IndividualData extends StatelessWidget {
  final String Fname;
  IndividualData({required this.Fname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text('First name is: ${Fname}')
        ],
      )

    );
  }
}
