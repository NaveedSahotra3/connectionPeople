import 'package:firebase_database/firebase_database.dart';
class LocationDataModel {

  String accuracy;
  String altitude;
  String bearing;
  String bearingAccuracyDegrees;
  String complete;
  String elapsedRealtimeNanos;
  String elapsedRealtimeUncertaintyNanos;
  String fromMockProvider;
  String latitude;
  String longitude;
  String provider;
  String speed;
  String speedAccuracyMetersPerSecond;
  String time;
  String verticalAccuracyMeters;

  LocationDataModel({
    this.accuracy,
    this.altitude,
    this.bearing,
    this.bearingAccuracyDegrees,
    this.complete,
    this.elapsedRealtimeNanos,
    this.elapsedRealtimeUncertaintyNanos,
    this.fromMockProvider,
    this.latitude,
    this.longitude,
    this.provider,
    this.speed,
    this.speedAccuracyMetersPerSecond,
    this.time,
    this.verticalAccuracyMeters
  });

  LocationDataModel.map(dynamic obj) {
    this.accuracy = obj['accuracy'];
    this.altitude = obj['altitude'];
    this.bearing = obj['bearing'];
    this.bearingAccuracyDegrees = obj['bearingAccuracyDegrees'];
    this.complete = obj['complete'];
    this.elapsedRealtimeNanos = obj['elapsedRealtimeNanos'];
    this.elapsedRealtimeUncertaintyNanos = obj['elapsedRealtimeUncertaintyNanos'];
    this.fromMockProvider = obj['fromMockProvider'];
    this.latitude = obj['latitude'];
    this.longitude = obj['longitude'];
    this.provider = obj['provider'];
    this.speed = obj['speed'];
    this.speedAccuracyMetersPerSecond = obj['speedAccuracyMetersPerSecond'];
    this.time = obj['time'];
    this.verticalAccuracyMeters = obj['verticalAccuracyMeters'];
  }

  String get _accuracy => accuracy;
  String get _altitude => altitude;
  String get _bearing => bearing;
  String get _bearingAccuracyDegrees => bearingAccuracyDegrees;
  String get _complete => complete;
  String get _elapsedRealtimeNanos => elapsedRealtimeNanos;
  String get _elapsedRealtimeUncertaintyNanos => elapsedRealtimeUncertaintyNanos;
  String get _fromMockProvider => fromMockProvider;
  String get _latitude => latitude;
  String get _longitude => longitude;
  String get _provider => provider;
  String get _speed => speed;
  String get _speedAccuracyMetersPerSecond => speedAccuracyMetersPerSecond;
  String get _time => time;
  String get _verticalAccuracyMeters => verticalAccuracyMeters;

  LocationDataModel.fromSnapshot(DataSnapshot snapshot) {
    accuracy = snapshot.value['accuracy'];
    altitude = snapshot.value['altitude'];
    bearing = snapshot.value['bearing'];
    bearingAccuracyDegrees = snapshot.value['bearingAccuracyDegrees'];
    complete = snapshot.value['complete'];
    elapsedRealtimeNanos = snapshot.value['elapsedRealtimeNanos'];
    elapsedRealtimeUncertaintyNanos = snapshot.value['elapsedRealtimeUncertaintyNanos'];
    fromMockProvider = snapshot.value['fromMockProvider'];
    latitude = snapshot.value['latitude'];
    longitude = snapshot.value['longitude'];
    provider = snapshot.value['provider'];
    speed = snapshot.value['speed'];
    speedAccuracyMetersPerSecond = snapshot.value['speedAccuracyMetersPerSecond'];
    time = snapshot.value['time'];
    verticalAccuracyMeters = snapshot.value['verticalAccuracyMeters'];
  }
}