import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/aboutapp.dart';
import 'package:flutterconnecct/screens/contactus.dart';
import 'package:flutterconnecct/screens/messenger.dart';
import 'package:flutterconnecct/screens/myitems.dart';
import 'package:flutterconnecct/screens/myneeds.dart';
import 'package:flutterconnecct/screens/notifications.dart';
import 'package:flutterconnecct/screens/premiumuser.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FreeItems extends StatefulWidget{

  String id;

  FreeItems(String _id){
    id  = _id;
  }

  _FreeItems createState() => new _FreeItems();

}

class _FreeItems extends State<FreeItems>{

  final DBref = FirebaseDatabase.instance.reference();

  double rating=0;
  var dbheler;
  String _response="";

  AuthCredential _authCredential;

  void signUp(String email,String password){
    Future<String>  data=  dbheler.registerUser(email,password);
    data.then((value){
      setState(() {
        _response= value;

      });
    });
  }


  TextEditingController txtcity = new TextEditingController();




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
          padding: EdgeInsets.all(15),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                 Container(
                   height: 40,
                   child: Row(
                     children: [
                       Container(

                         child: Text("City:",
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.black45,
                               fontSize: 18
                           ),
                         ),
                       ),

                       Container(
                         padding: EdgeInsets.only(left: 5),
                         width: 300,
                         child: TextField(
                           controller: txtcity,
                         ),
                       ),


                     ],
                   ),
                 ),



              Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      child: Text("Radius:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 18
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 5),
                      width: 230,
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: rating,
                        onChanged: (double newrating){
                           rating = newrating;
                           setState(() {

                           });
                        },
                      ),
                    ),

                    Container(
                      child: Text("${rating.toInt()} Miles",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 18
                        ),
                      ),
                    ),


                  ],
                ),
              ),




            ],
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
                title: Text("")
            ),


            BottomNavigationBarItem(
              title: Text(""),

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
              title: Text(''),
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
              title: Text(''),
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