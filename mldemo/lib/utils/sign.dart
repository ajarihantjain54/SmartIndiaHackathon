import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'; 
class MyHomePage extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async{
     GoogleSignInAccount googleSignInAccount =await googleSignIn.signIn();
     GoogleSignInAuthentication gSA  = await googleSignInAccount.authentication;

     FirebaseUser user  =await _auth.signInWithEmailAndPassword(
       email: "chambal@gmail.com",
       password: "thetantrik"
     );
     
     print("User Name : ${user.displayName} ");
     return user;
  }

  void _signOut(){
    googleSignIn.signOut();
    print("User Signed out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text("Log In") ,
              onPressed: ()=>_signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)), //_signIn().then(FirebaseUser user),
              color: Colors.blueAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
              ),
              RaisedButton(
                onPressed: ()=>_signOut(),
                child: Text("Sign Out"),
                color: Colors.red,
              )
          ],
        ),
      ),
      
    );
  }
}