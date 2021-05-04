import 'package:firebase_database/firebase_database.dart';
class NeedCategory {

  String id_category;
  String description;

  NeedCategory({this.id_category,this.description});

  NeedCategory.map(dynamic obj) {
    this.id_category = obj['id_category'];
    this.description = obj['description'];
  }

  String get id => id_category;
  String get title => description;

  NeedCategory.fromSnapshot(DataSnapshot snapshot) {
    id_category = snapshot.key;
    description = snapshot.value['description'];
  }
}