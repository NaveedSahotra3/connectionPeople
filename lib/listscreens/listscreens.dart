import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/listscreens/adduserNeeds.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/aboutapp.dart';
import 'package:flutterconnecct/screens/contactus.dart';
import 'package:flutterconnecct/listscreens/needwidget.dart';
import 'package:flutterconnecct/screens/messenger.dart';
import 'package:flutterconnecct/screens/myitems.dart';
import 'package:flutterconnecct/screens/myneeds.dart';
import 'package:flutterconnecct/screens/notifications.dart';
import 'package:flutterconnecct/screens/premiumuser.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/DataModels/userneeds.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class ListNeedScreens extends StatefulWidget{
  String userid;
  String needid;
  String btntitle;
  ListNeedScreens(String _id,String _needid,String title){
    userid  = _id;
    needid = _needid;
    btntitle = title;
  }
  _ListNeedScreens createState() => new _ListNeedScreens();
}

class _ListNeedScreens extends State<ListNeedScreens>{



  var dbRef;
  var dbhelper;
  Position  _position;
  double rating =0;
  TextEditingController txtcontroller = new TextEditingController();
  List<UserNeeds> itemsShop = List();
  UserNeeds itemShop;
  DatabaseReference itemRefShop;

  _getLocation() async
  {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    setState(() {
        txtcontroller.text = first.featureName.toString() + " " + first.addressLine.toString();
    });
  }

  void loaddata(){

    final databaseReference = FirebaseDatabase.instance.reference();

    void getData() {
      databaseReference.once().then((DataSnapshot snapshot) {
        print('Data : ${snapshot.value}');
      });
    }
  }

  _onEntryAddedShop(Event event) {
    setState(() {
      itemsShop.add(UserNeeds.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChangedShop(Event event) {
    var old = itemsShop.singleWhere((entry) {
      return entry.recipient_id == event.snapshot.key;
    });
    setState(() {
      itemsShop[itemsShop.indexOf(old)] = UserNeeds.fromSnapshot(event.snapshot);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
    dbhelper = new DBHelper();
    itemShop = UserNeeds();
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRefShop = database.reference().child('user_needs');
    itemRefShop.onChildAdded.listen(_onEntryAddedShop);
    itemRefShop.onChildChanged.listen(_onEntryChangedShop);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double swidth =  queryData.size.width;
    double sheight = queryData.size.height;

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
              color: Colors.white
          ),
          padding: EdgeInsets.all(5),

          child: ListView(

            children: [


              Container(
                decoration: BoxDecoration(
                   color: Colors.white
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height:40,
                      padding: EdgeInsets.only(top: 18, left: 10),
                      width: 40,
                      child: Text("City :",
                        style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.bold,
                           color: Colors.black87
                        ),
                      ),
                    ),

                    Container(
                      height:40,
                      width: swidth -50,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(left: 0,right: 0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: txtcontroller,
                        obscureText: false,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            border:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText: ""),
                      ),
                    ),

                  ],
                ),
              ),

              //-------------------------------------------------------------------------------------------
              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height:40,
                      padding: EdgeInsets.only(top: 18),
                      width: 50,
                      child: Text("Radius:",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87
                        ),
                      ),
                    ),

                    Container(
                      height:40,
                      width: swidth -140,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(left: 0,right: 0,top: 15),
                      child: Slider(
                        min: 0,
                        max: 100,
                        activeColor: Colors.red,
                        inactiveColor: Colors.black38,
                        value: rating,
                        onChanged: (double newrating){
                          rating = newrating;
                          setState(() {

                          });
                        },
                      ),
                    ),


                    Container(

                      padding: EdgeInsets.only(top: 5),
                      width: 50,
                      child: Text("${rating.toInt()} :Miles",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87
                        ),
                      ),
                    ),

                  ],
                ),

              ),

              //------------------------------------------------------------------------------------------

              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                        height: 50,
                        width: swidth -100,
                        padding: EdgeInsets.only(top: 5,),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          color: Colors.lightGreen,
                          onPressed: (){
                            UserNeeds needs;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AddUserNeeds(MyApp.profileDetails.userid.toString(),widget.needid,widget.btntitle)));


                          },
                          child: Text("${widget.btntitle.toString()}",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
          //------------------------------------------------------------------------------------------------------------------

              Container(

                height: 500,
                decoration: BoxDecoration(
                   color: Colors.white
                ),

                child: itemsShop.length==0 ?Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Container(
                        padding: EdgeInsets.all(10),
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
                  shrinkWrap:  false,
                  itemCount: itemsShop.length,
                  itemBuilder: (context,index){
                    print("The description is  :"+ itemsShop[index].description.toUpperCase());
                    return   NeedWidget(itemsShop[index]);
                  },
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