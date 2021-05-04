import 'package:firebase_database/firebase_database.dart';
class Gender {

  String id_gender;
  String description;

  Gender({this.id_gender,this.description});

  Gender.map(dynamic obj) {
    this.id_gender = obj['id_gender'];
    this.description = obj['description'];
  }

  String get id => id_gender;
  String get title => description;

  Gender.fromSnapshot(DataSnapshot snapshot) {
    id_gender = snapshot.key;
    description = snapshot.value['description'];
  }
}