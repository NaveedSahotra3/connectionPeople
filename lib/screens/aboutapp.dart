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
class AboutApp extends StatefulWidget{

  _AboutApp createState() => new _AboutApp();

}

class _AboutApp extends State<AboutApp>{


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
            children: [

              Container(
                width: 300,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: RichText(
                   textAlign: TextAlign.center,
                  text: TextSpan(


                    text: 'Join the \"',
                    style: TextStyle(fontSize: 20, color: Colors.black54,fontWeight: FontWeight.bold, ),
                    children: <TextSpan>[
                      TextSpan(text: 'Connecting ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue,fontStyle: FontStyle.italic)),
                      TextSpan(text: 'People \n',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 20,fontStyle: FontStyle.italic)),
                      TextSpan(text: ' In Need \"', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.blue,fontStyle: FontStyle.italic)),
                      TextSpan(text: ' movement', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black87)),
                      TextSpan(text: ' movement Today ! ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black87)),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                width: 300,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '....',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                width: 300,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(


                    text: 'We live in an awfully sinful world encapsulated with countless trials and tribulations. Millions upon millions of people are in need but dont know who to ask or where to go to find the resources that they seek. At the same time, there are millions of people who eagerly desire to help others in need but dont know how best to allocate their resources. ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),

              Container(
                width: 300,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(


                    text: 'We endeavor to connect the people in need to the individuals and organizations that have the resources to lend a helping hand. ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                width: 300,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '....',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),


              Container(
                width: 300,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(


                    text: 'At ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),
                    children: <TextSpan>[
                      TextSpan(text: 'CONNECTING ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue,)),
                      TextSpan(text: 'PEOPLE',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 16)),
                      TextSpan(text: ' IN NEED ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.blue,)),
                    ],
                  ),
                ),
              ),

              Container(
                width: 300,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'our 4 values drive our altruism:',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.normal, ),
                  ),
                ),
              ),



            Container(
               child: Column(

                    children: [

                       ListTile(
                         leading: Container(
                             child: Image.asset("images/applogo_small.jpg",
                             width: 30,
                             height: 30,
                           ),
                          ),
                         title:  Container(
                           padding: EdgeInsets.only(left: 0, right: 0),
                           child: RichText(
                             textAlign: TextAlign.start,
                             text: TextSpan(


                               text: 'We want you to proudly tell the world your own unique story by giving you the ',
                               style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),
                               children: <TextSpan>[
                                 TextSpan(text: 'opportunity to unashamedly ask for help.', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black87,)),
                               ],
                             ),
                           ),
                         ),
                       ),

                      SizedBox(
                         height: 10,
                      ),

                      ListTile(
                        leading: Container(
                          child: Image.asset("images/applogo_small.jpg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        title:  Container(
                          padding: EdgeInsets.only(left: 0, right: 0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'We are passionate about motivating others to ',
                              style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),
                              children: <TextSpan>[
                                TextSpan(text: 'learn how to love themselves and pursue their written goals.', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black87,)),
                                TextSpan(text: 'despite any hurdles that may come their way. We strongly advocate that someone \'s past doesnqgne them, butwhat that person is working towards is what matters most.  ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black87,)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      ListTile(
                        leading: Container(
                          child: Image.asset("images/applogo_small.jpg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        title:  Container(
                          padding: EdgeInsets.only(left: 0, right: 0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'We introduce ',
                              style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),
                              children: <TextSpan>[
                                TextSpan(text: 'systems that are both innovative and practical', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black87,)),
                                TextSpan(text: 'so that you can utilize your own creativity to help others in need. ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black87,)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      ListTile(
                        leading: Container(
                          child: Image.asset("images/applogo_small.jpg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        title:  Container(
                          padding: EdgeInsets.only(left: 0, right: 0),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'We think it is very important to lend a helping hand to others in need and that  ',
                              style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),
                              children: <TextSpan>[
                                TextSpan(text: 'We think it is very important to lend a helping hand to others in need and that ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black87,)),
                                TextSpan(text: 'We vet all charities before they are approved to appear on our website. Furthermore, our donors can visually see where their donations are in the charity\'s processes. ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black87,)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
               ),
            ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '...',
                    style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),

                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'We believe that it is what you DO that defines who you are as a person. ',
                    style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),

                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'What good is it my brothers and sisters, if someone claims to have faith but has no deeds? Can such faith save them? Suppose a brother or a sister is without clothes and daily food. If one of you says to them, \'Go in peace; keep warm and well fed,\' but does nothing about their physical, what good is it? In the same way, faith by itself, if it is not accompanied by action, is dead.\n —James 2:14-17 (NIV) ',
                    style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal,fontStyle: FontStyle.italic ),

                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '...',
                    style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.normal, ),

                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t Delay! Join the \" ',
                    style: TextStyle(fontSize: 14, color: Colors.black87,fontWeight: FontWeight.normal, ),
                    children: <TextSpan>[
                      TextSpan(text: 'Connecting ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue,fontStyle: FontStyle.italic)),
                      TextSpan(text: 'People ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,fontStyle: FontStyle.italic)),
                      TextSpan(text: 'In Need ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.blue,fontStyle: FontStyle.italic)),
                      TextSpan(text: '\"moveatpjeodav! ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black54,)),
                      TextSpan(text: 'It\'s Free! ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,)),
                          ],
                  ),
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
    }
    else if(action == messagesbar.notification){
      print("Notofications");
    }
  }



  void choicesettingsAction(String action) {
    if (action == sttingsbar.privacypolicy) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()),
      );
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