import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flatomate/Authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatomate/PopUp.dart';


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

   final TextEditingController Mobile = TextEditingController();
   final TextEditingController budget = TextEditingController();
   

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
                prefixIcon: Icon(Icons.house_rounded)


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
                  prefixIcon: Icon(Icons.email)



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
                  prefixIcon: Icon(Icons.security)




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
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                labelText: 'Mobile  Number',
                labelStyle:TextStyle(

                    color: Colors.white
                ),
                hintStyle: TextStyle(
                  color:Colors.black,
                ),
                fillColor: Colors.grey,
                filled: true,
                border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)



              ),
              controller: Mobile,
              keyboardType: TextInputType.number,
              maxLength: 10,

            ),
          ),
          Container(
            padding:EdgeInsets.all(10.0),
            margin:EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Budget for rent',
                  labelText: 'Budget for Rent',
                  labelStyle:TextStyle(

                      color: Colors.white
                  ),
                  hintStyle: TextStyle(
                    color:Colors.black,
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monetization_on_outlined)



              ),
              controller: budget,
              keyboardType: TextInputType.number,
              maxLength: 10,

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

          ElevatedButton(onPressed: () {
            if (first.text != null && middle.text != null &&
                last.text != null && city.text != null && age.text != null &&
                Email.text != null && Mobile.text != null) {
              Reg x = Reg(
                  first.text,
                  middle.text,
                  last.text,
                  city.text.toUpperCase(),
                  int.parse(age.text),
                  g,
                  Email.text,
                  Mobile.text,
              int.parse(budget.text));
              x.addUser(context);

              context.read<AuthenticationService>().signUp(
                  email: Email.text, pass: password.text);
            }
            else{
              Alert s = Alert();
              s.forRegisterError(context);
            }
          }
              , child: Text('Register me!'))


        ]
          )


        ),
      );


  }
}



