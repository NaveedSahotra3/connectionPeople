import 'package:firebase_database/firebase_database.dart';
class Ethnicity {

  String id_ethnicity;
  String description;
  bool   check = false;

  Ethnicity({this.id_ethnicity,this.description,this.check});

  Ethnicity.map(dynamic obj) {
    this.id_ethnicity = obj['id_ethnicity'];
    this.description = obj['description'];
  }

  String get id => id_ethnicity;
  String get title => description;

  Ethnicity.fromSnapshot(DataSnapshot snapshot) {
    id_ethnicity = snapshot.key;
    description = snapshot.value['description'];
  }
}