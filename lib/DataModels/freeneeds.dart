import 'package:firebase_database/firebase_database.dart';
class FreeNeeds {
  String donor_id;
  String attachment_path;
  String attachment_type;
  String description;
  String heading;
  String status;
  int timestamp;

  FreeNeeds({
    this.donor_id,
    this.attachment_path,
    this.attachment_type,
    this.description,
    this.heading,
    this.status,
    this.timestamp,

  });

  FreeNeeds.map(dynamic obj) {
    this.donor_id  = obj['needid'];
    this.attachment_path = obj['attachment_path'];
    this.attachment_type = obj['attachment_type'];
    this.description = obj['description'];
    this.heading = obj['heading'];
    this.status = obj['status'];
    this.timestamp = obj['timestamp'];
  }

  String get _donor_id => donor_id;
  String get _attachment_path => attachment_path;
  String get _attachment_type => attachment_type;
  String get _description => description;
  String get _heading => heading;
  String get _status => status;
  int get _timestamp => timestamp;

  FreeNeeds.fromSnapshot(DataSnapshot snapshot) {
    donor_id = snapshot.key;
    attachment_path = snapshot.value['attachment_path'];
    attachment_type = snapshot.value['attachment_type'];
    description = snapshot.value['description'];
    heading = snapshot.value['heading'];
    heading = snapshot.value['heading'];
    status = snapshot.value['status'];
    timestamp = snapshot.value['timestamp'];
  }
}