import 'package:charity_management_app/features/notifications/domain/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final CollectionReference _notificationCollection =
      FirebaseFirestore.instance.collection('post_created_notifications');

  Stream<List<NotificationModel>> getNotifications() {
    return _notificationCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return NotificationModel.fromDocument(doc);
      }).toList();
    });
  }
}
