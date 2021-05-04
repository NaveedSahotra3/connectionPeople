import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/DataModels/languages.dart';
import 'package:flutterconnecct/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutterconnecct/DataModels/location.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';


class DBHelper{

  //--------------------------------------------------------------------------------------------
  final DBRef = FirebaseDatabase.instance.reference();

  GoogleSignInAccount  _currentUser;
  String _contactText = '';
  Languages languages = new Languages();

  Future<String> registerUser(String username, String password)async{

      String data ="";
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
         data= "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        data= "The account already exists for that email.";
      }

      return data;
    } catch (e) {
      print(e);
    }


  }

  //-------------------------------------------------------------------------------------------------

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //----------------------------------------------------------------------------------------------
  void signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  //---------------------------------------------------------------------------------------------
  void readData(){
    DBRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }




  Future<Position> getlocation() async{

     Position  position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<FacebookLoginResult> handleFBSignIn() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("Cancelled");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
        print("Logged In");
        break;
    }
    return facebookLoginResult;
  }

  Future<String> uploadLocationData(DatabaseReference dbref, Position _positions) async{
     String res="";
    var _firebaseRef2 = FirebaseDatabase().reference().child('free_items/geolocation');
     await _firebaseRef2.set(
          {
            "altitude": "Pakistan"
          }
      ).then((_) {
        print("Has Been Uploaded");
        res =  "Has Been Uploaded";

      }).catchError((onError) {
        print("Has Been Failed to Upload");
        res =  "Has Been Failed to Upload";
      });
      return res;
    }


}