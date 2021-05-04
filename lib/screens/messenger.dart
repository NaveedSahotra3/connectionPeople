import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Messenger extends StatefulWidget{

  _Messenger createState() => new _Messenger();

}

class _Messenger extends State<Messenger>{


  TextEditingController txtmsg = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

          child: ListView(
            shrinkWrap: true,
            children: [

             Container(
               padding: EdgeInsets.all(5),
                child: Text("Select a user and start chatting",
                 textAlign: TextAlign.center, 
                   style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      
                   ),
                ),
             ),


              Container(
                height: 35,
                width: 250,
                child: TextField(
                    controller: txtmsg,
                    decoration: InputDecoration(
                      hintText: "Start typing a name",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                    )
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
                  onSelected: (selected) {},
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
                onSelected: (selected) {},
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
                onSelected: (selected) {},
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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }




  void choicemessageAction(String action){

    if(action == messagesbar.messages){
      print("Messages");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Messenger()),);
    }
    else if(action == messagesbar.notification){
      print("Notofications");
    }
  }



  void choicesettingsAction(String action) {
    if (action == sttingsbar.privacypolicy) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()),);
    }
    else if (action == messagesbar.notification) {
      print("Notofications");
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