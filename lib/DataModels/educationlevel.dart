import 'package:firebase_database/firebase_database.dart';
class EducationLevel {

  String id_level;
  String description;

  EducationLevel({this.id_level,this.description});

  EducationLevel.map(dynamic obj) {
    this.id_level = obj['id_level'];
    this.description = obj['description'];
  }

  String get id => id_level;
  String get title => description;

  EducationLevel.fromSnapshot(DataSnapshot snapshot) {
    id_level = snapshot.key;
    description = snapshot.value['description'];
  }
}