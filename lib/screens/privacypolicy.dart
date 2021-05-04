import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnecct/Auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterconnecct/dbhelper/dbhelper.dart';
import 'package:flutterconnecct/main.dart';
import 'package:flutterconnecct/screens/selectLanguage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PrivacyPolicy extends StatefulWidget{

  _PrivacyPolicy createState() => new _PrivacyPolicy();

}

class _PrivacyPolicy extends State<PrivacyPolicy>{


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
            shrinkWrap: true,
            children: [


              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '...',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'CONNECTING PEOPLE IN NEED Privacy Policy ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),


              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Introduction',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'This Privacy Policy applies to information that each of VON ELIJAH, LLC. and its subsidiary and affiliate entities worldwide including CONNECTING PEOPLE IN NEED (individually referred to herein as the "Von Elijah", "we," "us", "the Website", or "our") collects about you: in one of our stores or otherwise offline, through purchases you make from our catalog, or on or through VonElijah.com (or any sub-domain thereof), or one of our other websites, applications or other services from which you are accessing this Privacy Policy (each referred to herein as a "Site," and collectively, the "Sites"). This Privacy Policy describes how we collect such information, how we use it and to whom and under what circumstances we may disclose it. The personal information we collect is stored and/or controlled by VON ELIJAH, LLC and/or the relevant local corporate affiliate(s). ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),


              SizedBox(
                height: 15,
              ),



              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'User Consent ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'By accessing or otherwise using the Website, you agree to the terms and conditions of this Privacy Policy, which is incorporated into and forms a part of the Website\'s terms of service. You expressly consent to the processing and use of your information as described herein. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),


              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Types of Information Collected  ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'We collect certain Personal Information about you which may include, but is not limited to, information that is personally identifiable such as your name, e-mail address, address, user ID number, credit card information and other associated non-public information. We also collect data that is associated with the foregoing, as well as Anonymous Information, which is information that is not associated with or linked to your Personal Information and does not, based on our understanding, permit the identification of individual persons. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Collection of Personal Information  ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'We collect Personal Information you voluntarily submit to us through the Website. It is optional for you to utilize this Website. If you elect to utilize certain aspects of this Website, we may ask you to provide us with certain personal information about yourself, such as your first and last name, mailing address (including zip code), company name, email address and telephone number. When you order products or services, we may also ask you to provide us with your credit card number, expiration date and authentication codes or related information. If you do not provide certain mandatory information for a particular activity that requires it, you will not be permitted to engage in that activity. We may offer contests, sweepstakes or other contests that will require you to sign up and provide additional Personal Information. In that case, we will collect the information provided along with your involvement in such activity. Additionally, we reserve the right to collect any other information that you voluntarily enter, including Personal InformationWe may, but are in no way obligated to, provide for referral or tell another programs that allow you to recommend the site or an article to a friend. If you choose to do so, we will ask for your referral\'s name and email address. We will automatically send your friend one or more communications with either the product you have purchased or an invitation for him or her to visit the Website. The communication will allow the referral to unsubscribe from further communications. We will collect this information for the sole purpose of sending an invitation to visit the site, sending their product and tracking the success of any referral program. We will also collect your e-mail address and the full content of your e-mail, including attached files, and other information you provide. We may use and display your full name and email address to your referral. Additionally, we use your email address to contact you about the status of your referral. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Collection of Anonymous Information ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'We use technology to passively collect and store certain anonymous information that is not tied to a specific identified user which may include, but is not limited to your Internet protocol address, browser type and operating system. We, or our authorized third-party representatives may use Cookies and navigational data like Uniform Resource Locators (URL) to gather information regarding the date and time of your visit, the site you immediately came from and the site you immediately go to after accessing the Website. We reserve the right to disclose your Personal Information if we believe that such disclosure is necessary to (a) comply with relevant laws or to respond to subpoenas or warrants served on us; or (b) to protect and defend our rights or property, you, or third parties. You consent to us sharing your Personal Information under the circumstances described herein. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Use and Disclosure of Personal Information ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Except as otherwise stated in this Privacy Policy, we do not sell, trade, rent, or otherwise share for marketing purposes the Personal Information that we collect with any third parties other than third parties working with us. \n In general, we use Personal Information you provide to provide you access to the Website and its services, to improve the Website, tailor the features to you and to offer you additional information, opportunities, promotions and functionality from us or the specific advertisers you inquire about on the Website at your request. \nYour Personal Information may be disclosed to third-party service providers who work with us to provide some of the services on the Website and to help us communicate with you. Examples include, but are not limited to, sending email, analyzing data, marketing, processing payments (including credit card payments), and providing customer service. We expect our third-party service providers to not to use such information except as necessary to provide the relevant services to us.the relevant services to us.We may also share some or all of your Persona Information (other than credit card information) wit advertisers about whom you have inquired and/or purchased products from the Website. If you do not want any Personal Information shared with the advertisers, the do not click on their advertisements or purchase thei products from the Website \nWe also reserve the right to create Anonymous Information records from the Personal Information you provide by excluding information that we believe in good faith prevents it from being directly identified to a specific user such as your name.This would include any comments or feedback you provide us which becomes our property and we reserve the right to use any such material with your Personal Information redacted in perpetuity for any reason we deem appropriate including, but not limited to, marketing and or improvement of the Website, without royalties or compensation to you. Any such Anonymous Information is subject to terms of this Privacy Policy applicable to all Anonymous Information.   We may share some or all of your Personal Information with our affiliated companies that are under a common control, in which case, we will require them to honor this Privacy Policy.\nIf we go through a business transition such as a merger,acquisition by another company, or sale of all or a portion of our assets, your Personal Information maybe transferred. You acknowledge that such transfers may occur and are permitted by this Privacy Policy.The acquirer of any Personal Information through a business',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Use and Disclosure of Anonymous Information  ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'This Privacy Policy does not limit our use or disclosure of any Anonymous Information in any way, and we reserve the right to use and disclose Anonymous Information to our partners, advertisers and other third parties in our absolute discretion. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'The Ability of Others to View Your Information ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'When you use the Website, certain information you post or provide on the publicly available portions of the Website, may become publicly available and may be collected and used by others, including people outside of the control of the Website. We have no obligations with respect to any information that you post to publicly available parts of the Website. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),


              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Third Party Sites and Advertising  ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'The Website may contain links to other sites. We are not responsible for the privacy practices or the content of such other websites and this Privacy Policy does not apply to any other sites. We make no representation regarding the privacy practices of any other sites regardless whether we advertise on those sites or provide a link to those sites from our Website. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Ability to Unsubscribe ',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Should you receive a promotional email from us, you may opt-out of receiving additional promotional email communications from us by following the unsubscribe instructions on the emails. You may also contact us directly at',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),
                    children: <TextSpan>[
                      TextSpan(text: ' Support@ConnectingPeoplelnNeed.com', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.red, decoration:  TextDecoration.underline,)),
                      TextSpan(text: '.This applies to promotional communications and not administrative communications we feel are necessary to provide the services on the Website. ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black54,)),

                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Disclaimer of Guaranty of Security',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'We believe we have taken reasonable steps to protect your Personal Information. No one can fully guarantee or fully eliminate all risks associated with Personal Information and we make no such guarantees. ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),


              SizedBox(
                height: 15,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Revisions',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'This Privacy Policy is subject to occasional changes at our discretion. We will post any such changes to this page and may otherwise post other alerts on the Website or communicate such changes through email. If you ',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Minors',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'This Website is intended for use by those over 18 and minors under the age of 1 3 may not use the Website.',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Contact Us',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Please direct questions or comments about the Sites, these Terms, or any products you purchased through the',
                    style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w400, ),

                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'CONNECTING PEOPLE IN NEED',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Support@ConnectingPeopIeInNeed.com',
                    style: TextStyle(fontSize: 16, color: Colors.pink,fontWeight: FontWeight.w500,decoration: TextDecoration.underline, ),

                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '...',
                    style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.bold, ),

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