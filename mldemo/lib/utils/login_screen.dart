import 'dart:async';

import 'package:flutter/material.dart';
import 'animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'; 

  

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var emailS;
  var passS;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = new GoogleSignIn();

  // void _signIn() async{
  //    GoogleSignInAccount googleSignInAccount =await googleSignIn.signIn();
  //    GoogleSignInAuthentication gSA  = await googleSignInAccount.authentication;

  //    FirebaseUser user  =await _auth.signInWithEmailAndPassword(
  //      email: emailS,
  //      password: passS,
  //    );
     
  //    print("User Name : ${user.displayName} ");
  //    Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => HomePage()),
  // );
  // }
  @override
 // Future
  TextEditingController _zinda = new TextEditingController();
  var _passController = new TextEditingController();
  void _showUser()
  {
    setState(() {
      if(_zinda.text.isNotEmpty && _passController.text.isNotEmpty)
    {
      emailS = _zinda.toString();
      passS =_passController.toString()
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()));
    }

    
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Stack(
        children: <Widget>[

//           new Center(
//            child: new Image.asset("images/umbrella.png",
//            width: 490,
//            height: 1200,
//            fit: BoxFit.fill,),
//          ),

          new ListView(
        children: <Widget>[
           new Center(
             child: FlutterLogo(
               size: 200,
             ),
          //  child:new Image.asset("images/download.png",
          //  height: 240,
          //  width: 240,),
           ),
          new Padding(
            padding: new EdgeInsets.all(10),
          ),
          new Container(

            //color: Colors.white,
            margin: new EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: new TextField(
              controller: _zinda,
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
              decoration: new InputDecoration(
                contentPadding: new EdgeInsets.all(10),
                border: new OutlineInputBorder(

                    borderRadius: BorderRadius.circular(8)
                ),

                icon: new Icon(Icons.person),
                hintText: "Email",
              ),
            ),
          ),
          new Container(
           // color: Colors.white,
            margin: new EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: new TextField(
              //cursorColor: Colors.green,
              controller: _passController,
              style: new TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              obscureText: true,
              decoration: new InputDecoration(
                contentPadding: new EdgeInsets.all(10),
                border: new OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(8)
                ),
                icon: new Icon(Icons.lock),
                hintText: "Password",
              ),
              
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(10),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                padding: const EdgeInsets.fromLTRB(70, 5, 70, 5),
                color: Colors.redAccent,
                child: new Text("Login",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),),
                onPressed: () => _showUser(),
              ),
              new RaisedButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                padding: const EdgeInsets.fromLTRB(70, 5, 70, 5),
                color: Colors.redAccent.shade700,
                child: new Text("Guest",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),),
                onPressed: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context){
                   return new HomePage();
                  }));
                },
              ),
              new RaisedButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                padding: const EdgeInsets.fromLTRB(65, 5, 65, 5),
                color: Colors.blue.shade700,
                child: new Text("Sign Up",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize:  15
                ),),
                onPressed: () => debugPrint("Sign Up"),
              ),
            ],
          )
        ],
      ),
        ]

      ),
          backgroundColor: Colors.white,
    );
  }
}
