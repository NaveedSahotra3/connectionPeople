import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/userinfo.dart';
class SignUp extends StatefulWidget{

  _SignUp createState() => new _SignUp();

}

class _SignUp extends State<SignUp>{


  var dbheler;
  String _response ="";

  AuthCredential _authCredential;
  final _auth = FirebaseAuth.instance;

  void signUp(String email,String password){
    Future<String>  data=  dbheler.registerUser(email,password);
    data.then((value){
      setState(() {
        _response= value;

      });
    });
  }


  TextEditingController txtname = new TextEditingController();
  TextEditingController txtuname = new TextEditingController();
  TextEditingController txtpass1= new TextEditingController();
  TextEditingController txtpass2 = new TextEditingController();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbheler = new DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Center(
             child: ListView(
               shrinkWrap: true,
               children: [

                 Container(
                   padding: EdgeInsets.all(10),
                   child: Text("REGISTER",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontSize: 28,
                         color: Colors.blue,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                 ),


                 Container(

                   padding: EdgeInsets.all(10),
                   child: TextField(
                     controller: txtname,
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
                         hintText: "Full Name :"),
                   ),
                 ),



                 Container(

                   padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                   child: TextField(
                     controller: txtuname,
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
                     controller: txtpass1,
                     obscureText: true,
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
                         hintText: "Password :"),
                   ),
                 ),



                 Container(

                   padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                   child: TextField(
                     controller: txtpass2,
                     obscureText: true,
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
                         hintText: "Re Enter Password :"),
                   ),
                 ),


                 Container(
                   height: 70,
                   padding: EdgeInsets.all(10),
                   child: FlatButton(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                     color: Colors.lightGreen,
                     onPressed: () async{

                       if(txtuname.text == "") {
                         _response="Enter Username";
                         setState(() {
                         });
                       }
                       else if(txtname.text == ""){
                         _response="Enter Full Name";
                         setState(() {
                         });
                       }
                       else if(txtpass1.text == "") {
                         _response="Enter Password";
                         setState(() {
                         });
                       }
                       else if(txtpass2.text == ""){
                         _response="Re Enter Password";
                         setState(() {
                         });
                       }
                       else{
                         if(txtpass1.text == txtpass2.text){

                           try{
                             showLoaderDialog(context);
                             final newuser = await _auth.createUserWithEmailAndPassword(email: txtuname.text, password: txtpass1.text);
                             if(newuser != null){
                               MyApp.profileDetails.userid = newuser.user.uid.toString();
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Userinfo(newuser.user.uid.toString())),
                               );
                             }
                           }catch(e){
                             print(e);
                             setState(() {
                               _response  = e.toString();
                             });
                           }
                         }
                         else{
                           _response="Password Miss Math";
                           setState(() {
                           });
                         }
                       }
                     },

                     child: Text("Sign Up",
                       style: TextStyle(
                         color: Colors.white,

                       ),
                     ),
                   ),
                 ),


                 Container(

                   padding: EdgeInsets.only(top: 50),
                   child: FlatButton(
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => SignIn()),
                       );
                     },
                     child: Text("Member ? Sign in here !",
                       textAlign: TextAlign.center,
                       style: TextStyle(

                           fontWeight: FontWeight.w600,
                           fontSize: 16,
                           color: Colors.black54
                       ),
                     ),
                   ),
                 ),


                 Container(
                   padding: EdgeInsets.only(top: 50),
                   child: Text("${_response.toString()}",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontSize: 14,
                         color: Colors.red
                     ),
                   ),
                 )

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