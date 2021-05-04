import 'package:firebase_database/firebase_database.dart';
class CompaignDataModel {

  String heading;
  String description;
  String attachment_path;
  String amt_donated;
  String attachment_type;
  String organizer_id;
  String status;
  String exp_time;
  String goal;
  int timestamp;

  CompaignDataModel({
    this.heading,
    this.description,
    this.attachment_path,
    this.amt_donated,
    this.attachment_type,
    this.organizer_id,
    this.status,
    this.exp_time,
    this.goal,
    this.timestamp
  });

  CompaignDataModel.map(dynamic obj) {
    this.heading = obj['heading'];
    this.description = obj['description'];
    this.attachment_path = obj['attachment_path'];
    this.amt_donated = obj['amt_donated'];
    this.attachment_type = obj['attachment_type'];
    this.organizer_id = obj['organizer_id'];
    this.status = obj['status'];
    this.exp_time = obj['exp_time'];
    this.goal = obj['goal'];
    this.timestamp = obj['timestamp'];
  }

  String get _heading => heading;
  String get _description => description;
  String get _attachment_path => attachment_path;
  String get _amt_donated => amt_donated;
  String get _attachment_type => attachment_type;
  String get _organizer_id => organizer_id;
  String get _status => status;
  String get _exp_time => exp_time;
  String get _goal => goal;
  int get _timestamp => timestamp;

  CompaignDataModel.fromSnapshot(DataSnapshot snapshot) {
    heading = snapshot.value['heading'];
    description = snapshot.value['description'];
    attachment_path = snapshot.value['attachment_path'];
    attachment_type = snapshot.value['attachment_type'];
    organizer_id = snapshot.value['organizer_id'];
    status = snapshot.value['status'];
    exp_time = snapshot.value['exp_time'];
    goal = snapshot.value['goal'];
    timestamp = snapshot.value['timestamp'];
  }
}