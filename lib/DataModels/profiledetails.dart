import 'package:firebase_database/firebase_database.dart';
class ProfileDetails{

  String userid;
  String adminstatus;
  String display_name;
  String educationLevel;
  String firstName;
  String gender;
  String language;
  String lastName;
  String need_survey_stage;
  String PhotoUrl;
  String RegistrationStage;
  String title;
  String age;

  //List<String> ethnicity;

  ProfileDetails({
    this.userid,
    this.adminstatus,
    this.display_name,
    this.educationLevel,
    this.firstName,
    this.gender,
    this.language,
    this.lastName,
    this.need_survey_stage,
    this.PhotoUrl,
    this.RegistrationStage,
    this.title,
    this.age,
   // this.ethnicity,

  });

  ProfileDetails.map(dynamic obj) {
    this.userid = obj['userid'];
    this.adminstatus = obj['adminstatus'];
    this.display_name = obj['display_name'];
    this.educationLevel = obj['educationLevel'];
    this.firstName = obj['firstName'];
    this.gender = obj['gender'];
    this.language = obj['language'];
    this.lastName = obj['lastName'];
    this.need_survey_stage = obj['need_survey_stage'];
    this.PhotoUrl = obj['PhotoUrl'];
    this.RegistrationStage = obj['RegistrationStage'];
    this.title = obj['title'];
    this.age = obj['age'];
    //this.ethnicity = obj['ethnicity'];
  }

  String get _userid => userid;
  String get _adminstatus => adminstatus;
  String get _displayname => display_name;
  String get _educationLevel => educationLevel;
  String get _firstName => firstName;
  String get _gender => gender;
  String get _language => language;
  String get _lastName => lastName;
  String get _need_survey_stage => need_survey_stage;
  String get _PhotoUrl => PhotoUrl;
  String get _RegistrationStage=> RegistrationStage;
  String get _title => title;
  String get _age => age;
 // List<String> get _ethnicity => ethnicity;

  ProfileDetails.fromSnapshot(DataSnapshot snapshot) {
    userid = snapshot.key;
    adminstatus = snapshot.value['adminstatus'];
    display_name = snapshot.value['display_name'];
    educationLevel = snapshot.value['educationLevel'];
    firstName = snapshot.value['firstName'];
    gender = snapshot.value['gender'];
    language = snapshot.value['language'];
    lastName = snapshot.value['lastName'];
    need_survey_stage = snapshot.value['need_survey_stage'];
    PhotoUrl = snapshot.value['PhotoUrl'];
    RegistrationStage = snapshot.value['RegistrationStage'];
    title = snapshot.value['title'];
    age = snapshot.value['age'];
    //ethnicity = snapshot.value['ethnicity'];
  }

}