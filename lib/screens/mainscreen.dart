import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/DataModels/educationlevel.dart';
import 'package:flutterconnecct/DataModels/needCategoriers.dart';
import 'package:flutterconnecct/DataModels/userneeds.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterconnecct/listscreens/freeitemlistscreen.dart';
import 'package:flutterconnecct/listscreens/freeitemwidget.dart';
import 'package:flutterconnecct/listscreens/needwidget.dart';
import 'package:flutterconnecct/screens/freeitems.dart';
import 'package:flutterconnecct/screens/shelterNeeds.dart';
import 'package:flutterconnecct/listscreens/listscreens.dart';
import 'package:flutterconnecct/screens/tutoringNeeds.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterconnecct/screens/mainscreen.dart';
import 'package:flutterconnecct/screens/aboutapp.dart';
import 'package:flutterconnecct/screens/contactus.dart';
import 'package:flutterconnecct/screens/messenger.dart';
import 'package:flutterconnecct/screens/myitems.dart';
import 'package:flutterconnecct/screens/myneeds.dart';
import 'package:flutterconnecct/screens/notifications.dart';
import 'package:flutterconnecct/screens/premiumuser.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'package:flutterconnecct/listscreens/compaignlist.dart';
import 'dart:async';
import 'package:flutterconnecct/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:flutterconnecct/screens/selectEthnicity.dart';
class MainScreen extends StatefulWidget{

  String userid;
  MainScreen(String _id){
    userid= _id;
  }
  _MainScreen createState() => new _MainScreen();
}

class _MainScreen extends State<MainScreen>{



  String _response="";
  TextEditingController txtempneeds = new TextEditingController();

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  final dbRef = FirebaseDatabase.instance.reference().child("assistance_categories");
  List<NeedCategory> lists = [];

  FirebaseDatabase dbref;


  _onEntryAddedShop(Event event) {
    setState(() {
      itemsShop.add(NeedCategory.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChangedShop(Event event) {
    var old = itemsShop.singleWhere((entry) {
      return entry.id_category == event.snapshot.key;
    });
    setState(() {
      itemsShop[itemsShop.indexOf(old)] = NeedCategory.fromSnapshot(event.snapshot);
    });
  }


  List<NeedCategory> itemsShop = List();
  NeedCategory itemShop;
  DatabaseReference itemRefShop;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemShop = NeedCategory();
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRefShop = database.reference().child('assistance_categories');
    itemRefShop.onChildAdded.listen(_onEntryAddedShop);
    itemRefShop.onChildChanged.listen(_onEntryChangedShop);
  }

  @override
  Widget build(BuildContext context) {

    double  screenWidth = MediaQuery.of(context).size.width;
    double  screenHeoght = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
          padding: EdgeInsets.all(5),

          child:      Container(

            width: screenWidth,
            margin: EdgeInsets.only(left: 5,right:5),
            height: screenHeoght - 60,
            child:  ListView(

              children: [

                SizedBox(
                  height: 20,
                ),
                Container(

                   child: Column(
                       children: [

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
                           width: screenWidth-50,

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
                           ): GridView.builder(
                               shrinkWrap: true,
                               itemCount: itemsShop.length,

                               controller: new ScrollController(keepScrollOffset: false),
                               gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                 crossAxisSpacing: 20,
                                 childAspectRatio: 7/3,



                               ),
                               itemBuilder: (context,index){
                                 return  Container(
                                   margin: EdgeInsets.all(3),
                                   height: 20,
                                   child: FlatButton(
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                     color: Colors.blue,
                                     child: Text("${itemsShop[index].description.toString()} \n Needs",
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 16
                                       ),
                                     ),
                                     onPressed: (){
                                       UserNeeds needs;
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ListNeedScreens(MyApp.profileDetails.userid.toString(),itemsShop[index].id_category,"POST YOUR "+itemsShop[index].description.toUpperCase()+" NEED")));
                                     //  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  NeedWidget(needs)));
                                     },
                                   ),
                                 );
                               }),
                         ),


                         Container(
                           height:50,
                           margin: EdgeInsets.all(6),
                           width: (screenWidth - 10) ,
                           child: FlatButton(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                             color: Colors.amberAccent,
                             child: Text("Free  Items",
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                   color: Colors.red,
                                   fontSize: 18

                               ),
                             ),
                             onPressed: (){

                               Navigator.push(context, MaterialPageRoute(builder: (context) => ListFreeItemScreens(MyApp.profileDetails.userid, "1", "DONATE A FREE ITEM")),);
                               //Navigator.push(context, MaterialPageRoute(builder: (context) => FreeItemWidget()),);
                             },
                           ),
                         ),



                         SizedBox(
                           height: 10,
                         ),

                         Container(
                           height:50,
                           margin: EdgeInsets.all(6),
                           width: (screenWidth - 10) ,
                           child: FlatButton(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                             color: Colors.lightGreen,
                             child: Text("Fundraise a Campaign",
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 18

                               ),
                             ),
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => CompaignListScreens(MyApp.profileDetails.userid, "1", "CREATE COMPAIGN FOR FREE")));

                             },
                           ),
                         ),
                       ],
                   ),
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
    //Navigator.push(context, MaterialPageRoute(builder: (context) => MyItems()),);
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
  static const String home = "Home";
  static const List<String> choices = <String>[
    home,
  ];
}