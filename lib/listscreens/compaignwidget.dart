import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/DataModels/freeneeds.dart';
import 'package:flutterconnecct/DataModels/userneeds.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterconnecct/screens/userinfo.dart';
import 'package:flutterconnecct/DataModels/compaign.dart';

class CompaignWidget extends StatefulWidget {

  CompaignDataModel userNeeds;

  CompaignWidget(CompaignDataModel _userNeeds) {
    userNeeds = _userNeeds;
  }

  _CompaignWidget createState() => new _CompaignWidget();
}


class _CompaignWidget extends State<CompaignWidget>{


  var dbRef ;
  var _date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef   = FirebaseDatabase.instance.reference().child("user_data").child("jKobVZcxvLhc9ND6vDGFcLjPU5E2").child("profile_details").limitToFirst(1).once();
    _date = new DateTime.fromMicrosecondsSinceEpoch( widget.userNeeds.timestamp * 1000);
  }

  List<Map<dynamic, dynamic>> lists = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: FutureBuilder(
          future: dbRef,
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, values) {
                lists.add(values);
              });
              return new Container(

                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
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


                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                                padding: EdgeInsets.all(5),
                                child: Text("${DateTime.fromMicrosecondsSinceEpoch(widget.userNeeds.timestamp * 1000).day }-${DateTime.fromMicrosecondsSinceEpoch(widget.userNeeds.timestamp * 1000).month }-${DateTime.fromMicrosecondsSinceEpoch(widget.userNeeds.timestamp * 1000).year } \n ${DateTime.fromMicrosecondsSinceEpoch(widget.userNeeds.timestamp * 1000).hour }:${DateTime.fromMicrosecondsSinceEpoch(widget.userNeeds.timestamp * 1000).minute }:${DateTime.fromMicrosecondsSinceEpoch(widget.userNeeds.timestamp * 1000).millisecond }",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black54
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                                padding: EdgeInsets.all(5),
                                child: Text("${widget.userNeeds.heading.toString()}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87
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
                                padding: EdgeInsets.all(5),
                                child: Text("${widget.userNeeds.description.toString()}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54
                                  ),)
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
                              child: Image.network(widget.userNeeds.attachment_path.toString(),
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
                        height: 0.5,
                        decoration: BoxDecoration(
                            color: Colors.black54
                        ),
                      ),


                    ],
                  ),
                ),
              );
            }
            return Text("Loading ....");
          }),
    );

  }
}