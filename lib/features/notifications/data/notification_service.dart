import 'package:charity_management_app/features/notifications/domain/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationService {
  final _notificationDb =
      FirebaseFirestore.instance.collection('notifications');

  Stream<List<NotificationModel>> getNotification() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      final data =
          _notificationDb.where('receiverId', isEqualTo: uid).snapshots();
      final response = data.asyncMap((event) async {
        final data = Future.wait(event.docs.map((e) async {
          final json = e.data();
          return NotificationModel.fromJson(json);
        }).toList());
        return data;
      });
      return response;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
