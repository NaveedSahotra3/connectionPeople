import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/DataModels/userneeds.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterconnecct/screens/userinfo.dart';
import 'package:flutterconnecct/DataModels/profiledetails.dart';

class NeedWidget extends StatefulWidget {

  UserNeeds userNeeds;

  NeedWidget(UserNeeds _userNeeds) {
    userNeeds = _userNeeds;
  }

  _NeedWidget createState() => new _NeedWidget();
}


class _NeedWidget extends State<NeedWidget>{


  var dbRef ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef   = FirebaseDatabase.instance.reference().child("user_data").child(widget.userNeeds.recipient_id).child("profile_details").limitToFirst(1).once();

  }

  List<Map<dynamic, dynamic>> lists = [];
  @override
  Widget build(BuildContext context) {

     return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: FutureBuilder(
            future: dbRef,
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                lists.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                values.forEach((key, values) {
                  lists.add(values);
                });
                return new  Card(
                        elevation: .2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   
                                   CircleAvatar(
                    
                                      child: Image.network("https://firebasestorage.googleapis.com/v0/b/connectpeople-9866c.appspot.com/o/uploads%2Flogo.png?alt=media&token=c7d411f3-cad3-4746-aee8-afec0ea97e40",
                                       width: 35,
                                        height: 35,

                                      ),
                                   ),

                                   Container(
                                     padding: EdgeInsets.all(10),
                                      child: Text("${lists[0]['display_name']}",
                                       style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontSize: 16
                                       ),
                                      ),
                                   ),
                                   
                                 ],
                              ),
                            ),


                            SizedBox(
                              height: 10,
                            ),


                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    child: Text("${widget.userNeeds.description.toString()}")
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(
                              height: 10,
                            ),
                            
                            
                            Container(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                    Container(
                                       child: Image.network(widget.userNeeds.attachment_path,
                                        width: 150,
                                         height: 150,
                                       ),
                                    ),
                                  ],
                               ),
                            ),


                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 60,
                                      width: 250,
                                      padding: EdgeInsets.only(top: 5,bottom: 10),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                        color: Colors.lightGreen,
                                        onPressed: (){
                                        },
                                        child: Text("I want to help Privately",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),


                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 50,
                                      width: 120,
                                      padding: EdgeInsets.only(top: 5,bottom: 10),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                        color: Colors.lightBlueAccent,
                                        onPressed: (){
                                        },
                                        child: Text("SHARE LINK",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),


                            Container(
                              height: 0.3,
                              padding: EdgeInsets.only(bottom: 7, top: 2),
                              decoration: BoxDecoration(
                                  color: Colors.black54
                              ),
                            ),

                          ],
                        ),
                     );
              }
              return CircularProgressIndicator();
            }),
     );

  }
}