import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';


//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


import 'Reg.dart';


enum gender{Male,female}
class A extends StatelessWidget {
  const A({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) =>AuthenticationService(FirebaseAuth.instance),
      ),

      StreamProvider(create: (context) =>context.read<AuthenticationService>().authStateChanges, initialData: null,
      )
    ],
      child:MaterialApp( //root widget
        //themeMode:ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
            brightness: Brightness.dark
        ),
        home:Register(),
      ),
    );
  }
  }



class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
   String g="";
  gender? _Gender = gender.Male;
   final TextEditingController first = TextEditingController();

   final TextEditingController middle = TextEditingController();

   final TextEditingController last = TextEditingController();

   final TextEditingController city = TextEditingController();

  final TextEditingController City = TextEditingController();

   final TextEditingController Email = TextEditingController();

   final TextEditingController password = TextEditingController();
   final TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Register New User',style: TextStyle(
              fontSize: 30,
              fontFamily: 'NovaSquare'
          ),),
          backgroundColor: Colors.tealAccent[400],
          foregroundColor: Colors.black,
          centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Basic Details",style:
          TextStyle(fontFamily: 'NovaSquare',
          fontSize: 30,)),
          Divider(height:20.0,thickness: 10.0,),
          Container(
        padding:EdgeInsets.all(10.0),
        margin:EdgeInsets.all(10.0),
        child: TextField(
        decoration: InputDecoration(
        hintText: 'First Name',
        labelText: 'First Name',
        labelStyle:TextStyle(

        color: Colors.white
        ),
        hintStyle: TextStyle(
        color:Colors.black,
        ),
        fillColor: Colors.grey,
        filled: true,
        border: OutlineInputBorder(),


        ),
        controller: first,
        ),
        ),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Middle Name',
                labelText: 'Middle Name',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),


              ),
              controller: middle,
            ),
          ),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Last  Name',
                labelText: 'Last Name',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),


              ),
              controller: last,

            ),
          ),



          Text("Personal Details",style:
          TextStyle(fontFamily: 'NovaSquare',
            fontSize: 30,)),
          Divider(height:20.0,thickness: 10.0,),
          /* Container(
              color: Colors.grey,
              padding:EdgeInsets.all(10.0),
              margin:EdgeInsets.all(10.0),
              child: TextButton(
                onPressed:(){
                  DatePicker.showDatePicker(context,
                  onConfirm:(date) {print('confirm $date');},
                  showTitleActions: true,
                  minTime: DateTime(1995,1,1)
                 ,maxTime: DateTime(2022,6,7));
                },


                child:Text("Date of Birth",style:
                TextStyle(
                  fontSize: 10,
                color: Colors.white))),
              ),*/

            //AddUser(first.text),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'City',
                labelText: 'City',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),


              ),
              controller: city,

            ),
          ),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),


              ),
              controller: Email,

            ),
          ),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),


              ),
              controller: password,
              obscureText:false,

            ),
          ),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Age',
                labelText: 'Age',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),


              ),
              controller: age,
              keyboardType: TextInputType.number,

            ),
          ),
          Text("Select Gender"),
          ListTile(
            title:const Text("Male"),
            leading: Radio<gender>(
              value:gender.Male,
              groupValue: _Gender,
              onChanged: (gender? value){
                setState(() {
                  _Gender=value;
                  g="Male";
                  print(g);
                });
              },
            ),
          ),
          ListTile(
            title:const Text("Female"),
            leading: Radio<gender>(
              value:gender.female,
              groupValue: _Gender,
              onChanged: (gender? value){
                setState(() {
                  _Gender=value;
                  g="Female";
                  print(g);

                });
              },
            ),
          ),

          ElevatedButton(onPressed: (){
            Reg x=Reg(first.text,middle.text,last.text,city.text.toUpperCase(),age.text,g);
            x.addUser(context);

            context.read<AuthenticationService>().signUp(
                email: Email.text, pass: password.text);
            }, child: Text('Click'))


        ]
          )


        ),
      );


  }
}



