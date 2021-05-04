import 'package:firebase_database/firebase_database.dart';
class Age {

  String id_range;
  String description;

  Age({this.id_range,this.description});

  Age.map(dynamic obj) {
    this.id_range = obj['id_range'];
    this.description = obj['description'];
  }

  String get id => id_range;
  String get title => description;

  Age.fromSnapshot(DataSnapshot snapshot) {
    id_range = snapshot.key;
    description = snapshot.value['description'];
  }
}