import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/DataModels/educationlevel.dart';
import 'package:flutterconnecct/DataModels/profiledetails.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterconnecct/screens/aboutapp.dart';
import 'package:flutterconnecct/screens/contactus.dart';
import 'package:flutterconnecct/screens/employeementNeeds.dart';
import 'package:flutterconnecct/screens/messenger.dart';
import 'package:flutterconnecct/screens/myitems.dart';
import 'package:flutterconnecct/screens/myneeds.dart';
import 'package:flutterconnecct/screens/notifications.dart';
import 'package:flutterconnecct/screens/premiumuser.dart';
import 'package:flutterconnecct/screens/privacypolicy.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutterconnecct/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

class AddACompaign extends StatefulWidget{

  String userid;
  AddACompaign(String _id){
    userid= _id;
  }
  _AddACompaign createState() => new _AddACompaign();
}

class _AddACompaign extends State<AddACompaign>{
  bool status = false;
  final scafoldkey  = new GlobalKey<ScaffoldState>();
  var clr=Colors.black38;
  Position _position;
  bool btnstatus= false;
  String _response="";
  TextEditingController txtheading = new TextEditingController();
  TextEditingController txtdesc = new TextEditingController();
  TextEditingController txtdollers = new TextEditingController();

  File _image;
  final picker = ImagePicker();
  VoidCallback _showpersebottomsheetcallback;

  bool imgupsts = false;
  DateTime _datetime = DateTime.now();



  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imgupsts= true;

      } else {
        print('No image selected.');
        imgupsts= false;

      }
    });
  }
  var _firebaseRef = FirebaseDatabase().reference().child('campaigns');

  void _showbottomsheet(){

    setState(() {
      _showpersebottomsheetcallback = null;
    });

    scafoldkey.currentState.showBottomSheet((context)  {

      return  Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        padding: EdgeInsets.all(10),
        height: 150,

        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(20 ),
              child: Text("Upload Image",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),


            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //----------------------------------------------------------------------

                  Container(
                    width: 120,
                    child: Column(
                      children: [

                        GestureDetector(
                          onTap: (){
                            getImage();

                          },
                          child: Container(
                            child: Image.asset("images/filesicon.jpeg",
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),


                        Container(
                          child: Text("Files",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                          ),
                        )
                      ],
                    ),
                  ),




                  Container(
                    width: 120,
                    child: Column(
                      children: [

                        GestureDetector(
                          onTap: (){

                            getImage();
                          },
                          child: Container(
                            child: Image.asset("images/driveicon.jpg",
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),


                        Container(
                          child: Text("Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                          ),
                        )
                      ],
                    ),
                  ),



                  Container(
                    width: 120,
                    child: Column(
                      children: [

                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            child: Image.asset("images/cameraicon.png",
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),


                        Container(
                          child: Text("Camera",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
    }).closed.whenComplete(() {
      if(mounted){
        setState(() {

          _showpersebottomsheetcallback = _showbottomsheet;
        });
      }
    });
  }

  var dbhelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbhelper = new DBHelper();
    uploadlocation();
  }

  @override
  Widget build(BuildContext context) {

    double  screenWidth = MediaQuery.of(context).size.width;
    double  screenHeoght = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      home: Scaffold(
        key: scafoldkey,
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
                      child: Text("Connecting Peodddple in Need",
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
          padding: EdgeInsets.all(10),

          child:      Container(

            width: screenWidth,
            margin: EdgeInsets.only(left: 15,right: 15),

            child:  ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height:80,
                  width: screenWidth,
                  padding: EdgeInsets.all( 20,),
                  child: Text("CREATE A COMPAIGN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
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
                    width: screenWidth,
                    padding: EdgeInsets.only(top: 10,),
                    child: Column(
                      children: [


                        Container(

                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          margin: EdgeInsets.only(left: 5,right: 5),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: txtheading,
                            obscureText: false,
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
                                hintText: "Compaign name "),
                          ),
                        ),

                        Container(
                          height: 80,

                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          margin: EdgeInsets.only(left: 5,right: 5),
                          child: TextField(
                            textAlign: TextAlign.center,
                            minLines: 1,
                            controller: txtdesc,
                            obscureText: false,
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
                                hintText: "Compaign Description "),
                          ),
                        ),

                        Container(
                          width: screenWidth,
                          padding: EdgeInsets.only(top: 10,),
                          child: Text("Upload item image or video:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54
                            ),
                          ),
                        ),

                        Container(

                          child: _image == null
                              ? Text('')
                              : Image.file(_image,
                            width: 80,
                            height: 80,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              Container(
                                child: imgupsts == false ? Container():
                                Container(

                                  child:  OutlineButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        showAlertDialog(context);

                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.black12
                                        ),
                                        child: Column(

                                          children: <Widget>[
                                            Icon(Icons.delete,
                                              size: 32,
                                              color: Colors.black87,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      highlightedBorderColor: Colors.black12,
                                      color: Colors.black12,
                                      borderSide: new BorderSide(color: Colors.black12),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(2.0)
                                      )
                                  ),
                                ),
                              ),


                              Container(

                                child:  OutlineButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      _showbottomsheet();

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.black12
                                      ),
                                      child: Column(

                                        children: <Widget>[
                                          Icon(Icons.camera_alt,
                                            size: 32,
                                            color: Colors.black87,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 1,top: 1),
                                                child:  Text('  FREE  ',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    highlightedBorderColor: Colors.black12,
                                    color: Colors.black12,
                                    borderSide: new BorderSide(color: Colors.black12),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(2.0)
                                    )
                                ),
                              ),


                              Container(

                                child:  OutlineButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.black12
                                      ),
                                      child: Column(

                                        children: <Widget>[
                                          Icon(Icons.videocam,
                                            size: 32,
                                            color: Colors.black87,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 1,top: 1),
                                                child:  Text('PREMIUM',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    highlightedBorderColor: Colors.black12,
                                    color: Colors.black12,
                                    borderSide: new BorderSide(color: Colors.black12),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(2.0)
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),







                        Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [

                               Container(
                                  child: Column(
                                     children: [

                                       Container(
                                          child: Text("Goal:",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),),
                                       ),
                                       Container(
                                         child: Text("(Min \$5)",
                                           style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.lightBlue,
                                           ),),
                                       ),
                                     ],
                                  ),
                               ),
                               Container(
                                 width: 150,
                                 height: 35,
                                 padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                                 margin: EdgeInsets.only(left: 5,right: 5),
                                 child: TextField(
                                   textAlign: TextAlign.center,
                                   minLines: 1,
                                   controller: txtdollers,
                                   obscureText: false,
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
                                       EdgeInsets.only(left: 15, bottom: 2, top: 2, right: 15),
                                       hintText: "\$5"),
                                 ),
                               ),

                             ],
                          ),
                        ),


                        SizedBox(
                           height: 30,
                        ),
                        Container(
                          child: Text("Deadline",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Container(
                           height: 200,
                          child: CupertinoDatePicker(
                               initialDateTime: _datetime,
                               mode: CupertinoDatePickerMode.dateAndTime,
                               onDateTimeChanged: (datetime){
                                 setState(() {
                                   _datetime = datetime;
                                 });
                               },

                          ),
                        ),



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

                                        clr= Colors.black38;
                                      }
                                      else{

                                        clr= Colors.lightGreen;
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
                          width: screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  width: screenWidth * .3,
                                  padding: EdgeInsets.only(top: 5,),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                    color: Colors.black38,
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },

                                    child: Text("Cancel",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  )
                              ),


                              Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  width: screenWidth * .3,
                                  padding: EdgeInsets.only(top: 5,),
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                    color: clr,
                                    onPressed: (){
                                      if(txtheading.text ==""){
                                        print("Heading is Empty");
                                      }
                                      else if(txtdesc.text ==""){
                                        print("Description is Empty");
                                      }
                                      else if(_image ==null){
                                        print("Image  is False");
                                      }
                                      else if(status==false){
                                        print("Status  is False");
                                      }
                                      else
                                      {
                                        addImageToFirebase();
                                        String dwnstrng;
                                        Future<String> data= addImageToFirebase();
                                        data.then((value){
                                          dwnstrng = value;
                                          uploadToFirebase(dwnstrng);
                                        });
                                      }
                                    },
                                    child: Text("Save",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),




                      ],
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
  //int _currentIndex = 0;
  StorageReference storageReference = FirebaseStorage.instance.ref();
  Future<String> addImageToFirebase() async{

    String downloadUrl1;

    //CreateRefernce to path.
    StorageReference ref = storageReference.child("uploads/img/free_items/");

    //StorageUpload task is used to put the data you want in storage
    //Make sure to get the image first before calling this method otherwise _image will be null.

    StorageUploadTask storageUploadTask = ref.child("img"+DateTime.now().millisecondsSinceEpoch.toString()+".jpg").putFile(_image);

    if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
      final String url = await ref.getDownloadURL();
      print("The download URL is " + url);
    } else if (storageUploadTask.isInProgress) {

      storageUploadTask.events.listen((event) {
        double percentage = 100 *(event.snapshot.bytesTransferred.toDouble()
            / event.snapshot.totalByteCount.toDouble());
        print("THe percentage " + percentage.toString());
      });

      StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
      downloadUrl1 = await storageTaskSnapshot.ref.getDownloadURL();

      //Here you can get the download URL when the task has been completed.
      print("Download URL " + downloadUrl1.toString());

    } else{
      //Catch any cases here that might come up like canceled, interrupted
    }
    return downloadUrl1.toString();
  }

  uploadToFirebase (String purl) {
    String userkey =  _firebaseRef.push().key;

    _firebaseRef.child(userkey).set({
      "heading": txtheading.text,
      "description": txtdesc.text,
      "attachment_path": purl,
      "amt_donated": "0",
      "attachment_type": "Image",
      "organizer_id": MyApp.profileDetails.userid.toString(),
      "status": "1",
      "exp_time": _datetime.millisecondsSinceEpoch,
      "goal": txtdollers.text,
      "timestamp": DateTime.now().millisecondsSinceEpoch
    }).then((value) {

      _firebaseRef.child(userkey).child("/geolocation").set({
        "accurac": "oka hai",
        "accuracy": _position.accuracy.toString(),
        "altitude": _position.altitude.toString(),
        "bearing":  "0",
        "bearingAccuracyDegrees":"0",
        "complete": true,
        "elapsedRealtimeNanos": "",
        "elapsedRealtimeUncertaintyNanos": "0",
        "fromMockProvider": _position.mocked.toString(),
        "latitude": _position.latitude.toString(),
        "longitude": _position.longitude.toString(),
        "provider": "fused",
        "speed": _position.speed.toString(),
        "speedAccuracyMetersPerSecond": _position.speedAccuracy.toString(),
        "time": _position.timestamp.millisecondsSinceEpoch,
        "verticalAccuracyMeters": ""
      }).then((value) {
        _firebaseRef.child(userkey).child("/geolocation/extras").set({
          "empty": false,
          "parcelled": true,
          "size": "52",
        }).then((value) {
          txtdesc.text="";
          txtheading.text="";
          _image= null;
          status =false;
          btnstatus = false;
          clr = Colors.black38;
          setState(() {

          });
          Navigator.pop(context);
        });

      });

    });

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

  //--------------------------------------------------------------------------------------------------------

  void deleteImage(){
    _image = null;
    setState(() {
      imgupsts= false;
    });
  }

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No",
        style: TextStyle(
            color: Colors.red
        ),
      ),
      onPressed:  () {},
    );
    Widget continueButton = FlatButton(
      child: Text("Yes",
        style: TextStyle(
            color: Colors.red
        ),),
      onPressed:  () {
        deleteImage();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Delete Image"),
      content: Text("Are you about to delete this image.Are you sure to want to proceed ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  //------------------------------------------------------------------------
  void uploadlocation(){

    Future<Position> data = dbhelper.getlocation();
    data.then((value) {
      if(value !=null){
        _position = value;
        print("the Position latitude is :"+  _position.latitude.toString());
      }
      else{

      }
    });
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