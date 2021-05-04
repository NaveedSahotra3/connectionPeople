import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/messenger.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PremiumUser extends StatefulWidget{

  _MyNeeds createState() => new _MyNeeds();

}

class _MyNeeds extends State<PremiumUser>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.black54,

            labelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54
            ),

            tabs: [
              Tab( text: " Change\n  Cities"),
              Tab( text: "  Post\n Videos"),
              Tab( text: "Change\n Fonts"),
              Tab( text: "Change \n Colors"),
              Tab( text: "   Ad \n Removel"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            changeCities(context),
            postvideo(context),
            changefonts(context),
            changecolor(context),
            adremove(context)
          ],
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

  //------------------------------------------------------------------------------------------------------------
  Widget  changeCities(BuildContext context){
    return Container(
      child: Column(

        children: [

          Container(
            padding: EdgeInsets.only(top: 50),
            child: Text("Restless to search outside of your current city ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text("Expand your reach to cities worldwide ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
          ),


          Container(
            padding: EdgeInsets.all(10),
            child: Text("UPGRADE TO PREMIUM NOW! ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
            ),
          ),


          Container(
            height: 70,
            width: 250,
            padding: EdgeInsets.all(10),
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              color: Colors.red,
              onPressed: () async{


              },

              child: Text("BECOME A PREMIUM MEMBER",
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            padding: EdgeInsets.all(25),
            child: Text("Connecting People In Need is free for anyone to download and operate because we all can use a helping hand from time to time.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54
              ),
            ),
          ),


          Container(
            padding: EdgeInsets.all(25),
            child: Text("However our premium subscribers receive extrs perks and additional benifits will continue to be added to the fun list!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------------
Widget  postvideo(BuildContext context){
  return Container(
    child: Column(

      children: [

        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text("Excited to communicate with with more then text ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Upload Video to clearly deliever your messages or spice up with profile image!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(10),
          child: Text("UPGRADE TO PREMIUM NOW! ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),
          ),
        ),


        Container(
          height: 70,
          width: 250,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: Colors.red,
            onPressed: () async{


            },

            child: Text("BECOME A PREMIUM MEMBER",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ),

        SizedBox(
          height: 15,
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Connecting People In Need is free for anyone to download and operate because we all can use a helping hand from time to time.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(25),
          child: Text("However our premium subscribers receive extrs perks and additional benifits will continue to be added to the fun list!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),
      ],
    ),
  );
}


//------------------------------------------------------------------------------------------------------------
Widget  changefonts(BuildContext context){
  return Container(
    child: Column(

      children: [

        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text("Ready to show off your creativity ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Change the shape and color of your text Bubbles ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(10),
          child: Text("UPGRADE TO PREMIUM NOW! ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),
          ),
        ),


        Container(
          height: 70,
          width: 250,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: Colors.red,
            onPressed: () async{


            },

            child: Text("BECOME A PREMIUM MEMBER",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ),

        SizedBox(
          height: 15,
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Connecting People In Need is free for anyone to download and operate because we all can use a helping hand from time to time.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(25),
          child: Text("However our premium subscribers receive extrs perks and additional benifits will continue to be added to the fun list!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),
      ],
    ),
  );
}

//------------------------------------------------------------------------------------------------------------
Widget  changecolor(BuildContext context){
  return Container(
    child: Column(

      children: [

        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text("Eager to display your uniqueness ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Change the font and color of your text ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(10),
          child: Text("UPGRADE TO PREMIUM NOW! ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),
          ),
        ),


        Container(
          height: 70,
          width: 250,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: Colors.red,
            onPressed: () async{


            },

            child: Text("BECOME A PREMIUM MEMBER",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ),

        SizedBox(
          height: 15,
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Connecting People In Need is free for anyone to download and operate because we all can use a helping hand from time to time.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(25),
          child: Text("However our premium subscribers receive extrs perks and additional benifits will continue to be added to the fun list!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),
      ],
    ),
  );
}

//------------------------------------------------------------------------------------------------------------
Widget  adremove(BuildContext context){
  return Container(
    child: Column(

      children: [

        Container(
          padding: EdgeInsets.only(top: 50),
          child: Text("Tired of ads pop-ups ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Get  ride of those pesky advertisements !",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(10),
          child: Text("UPGRADE TO PREMIUM NOW! ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red
            ),
          ),
        ),


        Container(
          height: 70,
          width: 250,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            color: Colors.red,
            onPressed: () async{


            },

            child: Text("BECOME A PREMIUM MEMBER",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ),

        SizedBox(
          height: 15,
        ),

        Container(
          padding: EdgeInsets.all(25),
          child: Text("Connecting People In Need is free for anyone to download and operate because we all can use a helping hand from time to time.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),


        Container(
          padding: EdgeInsets.all(25),
          child: Text("However our premium subscribers receive extrs perks and additional benifits will continue to be added to the fun list!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54
            ),
          ),
        ),
      ],
    ),
  );
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

class mybar {
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
