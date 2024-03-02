import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String postHeadline;
  final String time;
  final String address;

  NotificationModel({
    required this.id,
    required this.postHeadline,
    required this.time,
    required this.address,
  });

  factory NotificationModel.fromDocument(DocumentSnapshot doc) {
    return NotificationModel(
      id: doc.id,
      postHeadline: doc['postHeadline'],
      time: doc['time'],
      address: doc['address'],
    );
  }
}
