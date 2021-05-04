import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:flutterconnecct/screens/seletgender.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/DataModels/age.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:firebase_database/firebase_database.dart';
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

import 'dart:async';

import 'package:flutterconnecct/screens/selectEducationLevel.dart';
class SelectAge extends StatefulWidget{

  String id;
  SelectAge(String _id){
    id= _id;
  }

  _SelectAge createState() => new _SelectAge();

}
enum SingingCharacter { lafayette, jefferson }

class _SelectAge extends State<SelectAge>{

  List _languages;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Age> itemsShop = List();
  Age itemShop;
  DatabaseReference itemRefShop;

  void loaddata(){

    final databaseReference = FirebaseDatabase.instance.reference();

    void getData() {
      databaseReference.once().then((DataSnapshot snapshot) {
        print('Data : ${snapshot.value}');
      });
    }
  }


  var dbheler;
  String _response="";
  int selectedRadio;

  TextEditingController txtfname = new TextEditingController();
  TextEditingController txtlname = new TextEditingController();

  int selectedRadioTile;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int selectedRadioTile;
    selectedRadio = 0;
    selectedRadioTile = 0;
    itemShop = Age();
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRefShop = database.reference().child('age_range');
    itemRefShop.onChildAdded.listen(_onEntryAddedShop);
    itemRefShop.onChildChanged.listen(_onEntryChangedShop);
  }

  final int num=0;

  _onEntryAddedShop(Event event) {
    setState(() {
      itemsShop.add(Age.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChangedShop(Event event) {
    var old = itemsShop.singleWhere((entry) {
      return entry.id_range == event.snapshot.key;
    });
    setState(() {
      itemsShop[itemsShop.indexOf(old)] = Age.fromSnapshot(event.snapshot);
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
  Age selectedUser;

  setSelectedUser(Age user) {
    setState(() {
      selectedUser = user;
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double  screenWidth = MediaQuery.of(context).size.width;
    double  screenHeoght = MediaQuery.of(context).size.height;
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final textTheme = Theme
        .of(context)
        .textTheme;

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
          decoration: BoxDecoration(

          ),
          padding: EdgeInsets.all(20),
          child:      Container(
            width: screenWidth,
            margin: EdgeInsets.only(left: 35,right: 35),
            height: screenHeoght - 60,
            child:  Column(
              children: [
                Container(
                  height:40,
                  width: screenWidth,
                  padding: EdgeInsets.only(top: 10,),
                  child: Text("AGE:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft:  const  Radius.circular(10.0),
                        topRight: const  Radius.circular(10.0),
                        bottomLeft:  const  Radius.circular(10.0),
                        bottomRight: const  Radius.circular(10.0),

                      )
                  ),
                  width: screenWidth-100,
                  height: screenHeoght- 350,
                  child: itemsShop.length==0 ?Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Container(
                          padding: EdgeInsets.all(20),
                          child:   Text("Loading",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87
                            ),
                          ),
                        )
                      ],
                    ),
                  ):ListView.builder(
                    itemCount: itemsShop.length,
                    itemBuilder: (context,index){
                      return   RadioListTile(
                        value: itemsShop[index],
                        groupValue: selectedUser,
                        title: Text("${itemsShop[index].description}"),
                        onChanged: (currentUser) {
                          print("Current User ${itemsShop[index].description}");
                          setSelectedUser(currentUser);
                        },
                      );
                    },
                  ),
                ),

                Container(
                    height: 50,
                    width: screenWidth,
                    padding: EdgeInsets.only(top: 5,),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      color: Colors.lightGreen,
                      onPressed: (){
                        MyApp.profileDetails.age = selectedUser.description.toString();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectGender(widget.id.toString())));
                      },

                      child: Text("Next",
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
                title:Container(),
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
