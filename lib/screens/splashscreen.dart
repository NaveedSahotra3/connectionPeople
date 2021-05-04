import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:flutterconnecct/screens/userinfo.dart';

class SplashScreen extends StatefulWidget{

  _SplashScreen createState() => new _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    go();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
           body: Container(
             decoration: BoxDecoration(
                color: Colors.white
             ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("images/applogo.jpeg"),
                    ),
                  ],
                ),
              ),
           ),
        ),
    );
  }



  void go(){
    Future.delayed(const Duration(milliseconds: 5000), () {

// Here you can write your code

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));

    });
  }
}