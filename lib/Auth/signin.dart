import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signup.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/mainscreen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import "package:http/http.dart" as http;
import 'package:flutterconnecct/screens/userinfo.dart';
import 'dart:convert';

import 'dart:convert';


class SignIn extends StatefulWidget{

  _SignIn createState() => new _SignIn();

}

class _SignIn extends State<SignIn>{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _response ="";
  TextEditingController txtUsername= new TextEditingController();
  TextEditingController txtPassword= new TextEditingController();




  var dbhelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper=new DBHelper();
  }


  UserCredential _userCredential;

  void signinwithEnailPassword(String email, String pass){
    Future<UserCredential> data = dbhelper.signInwithEmailandPass(email,pass);
    data.then((value){
      _userCredential = value;
      setState(() {
        // print("The id id   :"+ _userCredential.user.email.toString());
        // print("The Name is :"+ _userCredential.user.displayName.toString());
        // print("The Email is:"+ _userCredential.user.email.toString());
        // print("The Phone Number is :"+ _userCredential.user.phoneNumber.toString());
      });
    });
  }


  //----------------------------------------------------------------------------------


  void signinwithgmail(){

    Future<UserCredential> data= dbhelper.signInWithGoogle();
    data.then((value) {
      _userCredential = value;
      setState(() {
        // print("The id id   :"+ _userCredential.user.uid.toString());
        // print("The Name is :"+ _userCredential.user.displayName.toString());
        // print("The Email is:"+ _userCredential.user.email.toString());
        // print("The Phone Number is :"+ _userCredential.user.phoneNumber.toString());
      });
    });
  }

  //-------------------------------------------------------------------------------------


  void signinwithfaebookbtn(){

    Future<FacebookLoginResult> data= dbhelper.handleFBSignIn();
    data.then((value) {
       MyApp.profileDetails.userid  = value.accessToken.userId.toString();
       print("The FaceBook User id is :"+ value.accessToken.toString());
      setState(() {
        // print("The id id   :"+ _userCredential.user.uid.toString());
        // print("The Name is :"+ _userCredential.user.displayName.toString());
        // print("The Email is:"+ _userCredential.user.email.toString());
        // print("The Phone Number is :"+ _userCredential.user.phoneNumber.toString());
      });
    });
  }





  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

        body: Container(
          padding: EdgeInsets.all(15),
          child: Center(
              child:  ListView(
                shrinkWrap: true,
                children: [

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("WELLCOME",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(


                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextField(
                      controller: txtUsername,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                          border:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Email :"),
                    ),
                  ),

                  Container(

                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextField(
                      controller: txtPassword,
                      obscureText: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          border:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Password :"),
                    ),
                  ),

                  Container(
                    height: 70,
                    padding: EdgeInsets.all(10),
                    child: FlatButton(

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      color: Colors.lightGreen,
                      onPressed: () async{

                        if(txtUsername.text=="" ){
                          _response = "Enter Email First";
                          setState(() {

                          });
                        }
                        else if(txtPassword.text==""){
                          _response = "Enter Password First";
                          setState(() {

                          });
                        }
                        else{

                          //signinwithEnailPassword(txtUsername.text, txtPassword.text);

                          try{
                            showLoaderDialog(context);
                            final user  = await _auth.signInWithEmailAndPassword(
                                email: txtUsername.text,
                                password: txtPassword.text
                            );
                            if(user != null){
                              //txtUsername.text= "";
                              //txtPassword.text="";
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MainScreen(user.user.uid.toString())),
                              );
                            }
                          }
                          catch(e){
                            _response = e.toString();
                            setState(() {

                            });
                          }
                        }
                      },

                      child: Text("SIGN IN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18

                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    padding: EdgeInsets.all(5 ),
                    child: SignInButton(
                      Buttons.Google,
                      text: "Sign up with Google",
                      onPressed: () {
                        signinwithgmail();
                      },
                    ),
                  ),



                  Container(
                    height: 50,
                    padding: EdgeInsets.all(5),

                    child: SignInButton(
                      Buttons.Facebook,
                      text: "Sign up with FaceBook",
                      onPressed: () {
                        signinwithfaebookbtn();
                      },
                    ),
                  ),


                  Container(

                      padding: EdgeInsets.only(top: 10),

                      child: GestureDetector(
                        child: Text("${_response.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 14

                          ),
                        ),
                        onTap: (){

                        },
                      )
                  ),

                  Container(

                      padding: EdgeInsets.only(top: 50),

                      child: GestureDetector(
                        child: Text("Forget Password ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w600,
                              fontSize: 16

                          ),
                        ),
                        onTap: (){

                        },
                      )
                  ),


                  Container(

                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        child:  Text("Do you have account ? Sign Up !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 16

                          ),
                        ),
                        onTap: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp()),
                          );
                        },
                      )
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}