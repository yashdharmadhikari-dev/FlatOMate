

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthenticationService{

  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges =>_firebaseAuth.authStateChanges();
  Future<String?> SignOut() async{
    await _firebaseAuth.signOut();
  }
 Future<void> signIn({required String email,required String pass}) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);

    }
    on FirebaseAuthException catch(e){
      print("wrong credentials");


    }
  }

  Future<String?> signUp({required String email,required String pass}) async{
try{
  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      return "Signed in";
}
on FirebaseAuthException catch(e){
  return e.message;
}
  }
}

