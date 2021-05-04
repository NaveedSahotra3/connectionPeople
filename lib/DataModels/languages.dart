import 'package:firebase_database/firebase_database.dart';
class Languages {

  String id_language;
  String description;

  Languages({this.id_language,this.description});

  Languages.map(dynamic obj) {
    this.id_language = obj['id'];
    this.description = obj['title'];
  }

  String get id => id_language;
  String get title => description;

  Languages.fromSnapshot(DataSnapshot snapshot) {
    id_language = snapshot.key;
    description = snapshot.value['description'];
  }
}