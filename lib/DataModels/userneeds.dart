import 'package:firebase_database/firebase_database.dart';
class UserNeeds {

  String attachment_path;
  String attachment_type;
  String description;
  String item_need_id;
  String recipient_id;
  String status;
  int timestamp;

  UserNeeds({
    this.attachment_path,
    this.attachment_type,
    this.description,
    this.item_need_id,
    this.recipient_id,
    this.status,
    this.timestamp

  });

  UserNeeds.map(dynamic obj) {
    this.attachment_path = obj['attachment_path'];
    this.attachment_type = obj['attachment_type'];
    this.description = obj['description'];
    this.item_need_id = obj['item_need_id'];
    this.recipient_id = obj['recipient_id'];
    this.status = obj['status'];
    this.timestamp = obj['timestamp'];
  }

  String get _attachment_path => attachment_path;
  String get _attachment_type => attachment_type;
  String get _description => description;
  String get _item_need_id => item_need_id;
  String get _recipient_id => recipient_id;
  String get _status => status;
  int get _timestamp => timestamp;

  UserNeeds.fromSnapshot(DataSnapshot snapshot) {

    attachment_path = snapshot.value['attachment_path'];
    attachment_type = snapshot.value['attachment_type'];
    description = snapshot.value['description'];
    item_need_id = snapshot.value['item_need_id'];
    recipient_id = snapshot.value['recipient_id'];
    status = snapshot.value['status'];
    timestamp = snapshot.value['timestamp'];
  }
}