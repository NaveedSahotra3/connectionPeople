import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/DataModels/languages.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/donateFreeitem.dart';
import 'package:flutterconnecct/screens/freeitems.dart';
import 'package:flutterconnecct/screens/selectage.dart';
import 'package:flutterconnecct/screens/aboutapp.dart';
import 'package:flutterconnecct/screens/contactus.dart';
import 'package:flutterconnecct/screens/messenger.dart';
import 'package:flutterconnecct/screens/myitems.dart';
import 'package:flutterconnecct/screens/myneeds.dart';
import 'package:flutterconnecct/screens/notifications.dart';
import 'package:flutterconnecct/screens/premiumuser.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'dart:async';
class TermandConditions extends StatefulWidget{

  String id;
  TermandConditions(String _id){
    id= _id;
  }
  _TermandConditions createState() => new _TermandConditions();
}

class _TermandConditions extends State<TermandConditions>{


  bool btnstatus= false;
  var  clr = Colors.black38;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final dbRef = FirebaseDatabase.instance.reference().child("user_data/"+MyApp.profileDetails.userid.toString()+"/profile_details");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  bool status = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double  screenWidth = MediaQuery.of(context).size.width;
    double  screenHeoght = MediaQuery.of(context).size.height;


    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            child: Row(
              children: [

                Container(
                  child: Container(
                    width: 50,
                    child: Image.asset("images/applogo_small.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Container(
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Connecting People in Need",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(

          ),
          padding: EdgeInsets.all(20),
          child:  Container(
          child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:  Row(
                  children: [

                    Container(
                      child:  Switch(
                        activeColor: Colors.pinkAccent,
                        value: status,
                        onChanged: (value) {
                          print("VALUE : $value");
                          setState(() {
                            status = value;
                            if(status == false){
                              btnstatus = false;
                              clr = Colors.black38;
                            }
                            else{
                              btnstatus= true;
                              clr = Colors.lightGreen;
                            }
                          });
                        },
                      ),
                    ),

                    Container(
                      child: Text("Agree to terms & Conditions",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54
                        ),
                      ),

                    ),
                  ],
                ),
              ),

              Container(
                  height: 50,
                  width: screenWidth-100,
                  padding: EdgeInsets.only(top: 5,),
                  child: FlatButton(

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    color: clr,
                    onPressed: (){

                    if(btnstatus == false){

                    }
                    else {
                      if (MyApp.profileDetails == null) {
                        print("It is Null with null Values");
                      }
                      else if (status == false) {
                        print("You are Not Agree To Term & Conditions");
                      }
                      else {
                        dbRef.push().set(
                            {
                              "admin_status": false,
                              "age": MyApp.profileDetails.age,
                              "display_name": MyApp.profileDetails.display_name,
                              "education_level": MyApp.profileDetails.educationLevel,
                              "first_name": MyApp.profileDetails.firstName,
                              "gender": MyApp.profileDetails.gender,
                              "language": MyApp.profileDetails.language,
                              "last_name": MyApp.profileDetails.lastName,
                              "need_survey_stage": MyApp.profileDetails.need_survey_stage,
                              "photo_url": "/logo.png",
                              "registration_stage": "3",
                              "title": ""
                            }
                        ).then((_) {
                          print("Has Been Uploaded");
                          _scaffoldKey.currentState.showSnackBar(
                              new SnackBar(
                                  content: new Text('Submitted Successflully'),
                              )
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectDonateFreeItem(MyApp.profileDetails)));

                        }).catchError((onError) {
                          _scaffoldKey.currentState.showSnackBar(
                              new SnackBar(
                                  content: new Text(onError)
                              )
                          );
                        });
                       }
                      }
                    },

                    child: Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  )
                ),
               ],
             ),
           ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,

          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
            print("The Current index is :"+_currentIndex.toString());
          },
          items: [
            BottomNavigationBarItem(

              icon:  PopupMenuButton<String>(
                onSelected: choicehomeAction,
                icon: Image.asset("images/home.png",
                  width: 50,
                  height: 50,
                ),
                itemBuilder: (BuildContext context) {
                  return homebar.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87
                        ),),

                    );
                  }).toList();
                },
              ),
              title: Container(),
            ),


            BottomNavigationBarItem(
              title: Container(),

              icon:  PopupMenuButton<String>(
                onSelected: choicesettingsAction,
                icon: Image.asset("images/settings.png",
                  width: 50,
                  height: 50,
                ),
                itemBuilder: (BuildContext context) {
                  return sttingsbar.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87
                        ),),

                    );
                  }).toList();
                },
              ),
            ),


            BottomNavigationBarItem(
              title: Container(),
              icon:  PopupMenuButton<String>(
                onSelected: choicemessageAction,
                icon: Image.asset("images/message.png",
                  width: 50,
                  height: 50,
                ),
                itemBuilder: (BuildContext context) {
                  return messagesbar.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87
                        ),
                      ),

                    );
                  }).toList();
                },
              ),
            ),

            BottomNavigationBarItem(
              title: Container(),
              icon:  PopupMenuButton<String>(
                onSelected:choicemyAction,
                icon: Image.asset("images/mylogo.png",
                ),
                itemBuilder: (BuildContext context) {
                  return mybar.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87
                        ),
                      ),

                    );
                  }).toList();
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
  int _currentIndex = 0;
  void choicemyAction(String action){

    if(action == mybar.myneeds){
      print("Needs");
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyNeeds()),);
    }
    else if(action == mybar.myitems){
      print("Items");
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyItems()),);
    }
  }


  void choicehomeAction(String action){

    print("Homepage");
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyItems()),);
  }



  void choicemessageAction(String action){

    if(action == messagesbar.messages){
      print("Messenger");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Messenger()),);
    }
    else if(action == messagesbar.notification){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()),);
      print("Notofications");
    }
  }



  void choicesettingsAction(String action) {
    if (action == sttingsbar.privacypolicy) {
      print("Privacy Policy");
      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()),);
    }
    else if (action == sttingsbar.contactus) {
      print("Contact Us");
      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()),);
    }
    else if (action == sttingsbar.aboutapp) {
      print("About App");
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()),);
    }
    else if (action == sttingsbar.premiumuser) {
      print("Premium User");
      Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumUser()),);
    }
    else if (action == sttingsbar.logout) {
      print("Logout");
      // Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumUser()),);
    }
  }
}


class messagesbar{
  static const String messages = "Messenger";
  static const String notification = "Notifications";

  static const List<String> choices = <String>[
    messages,
    notification
  ];
}


class sttingsbar{
  static const String contactus = "Contact Us";
  static const String aboutapp = "About this App";
  static const String premiumuser = "Premium Users";
  static const String privacypolicy = "Privacy Policy";
  static const String logout = "Logout";

  static const List<String> choices = <String>[
    contactus,
    aboutapp,
    premiumuser,
    privacypolicy,
    logout
  ];
}

class mybar{
  static const String myneeds = "My Needs";
  static const String myitems = "My Items";

  static const List<String> choices = <String>[
    myneeds,
    myitems
  ];
}

class homebar{
  static const List<String> choices = <String>[
  ];
}