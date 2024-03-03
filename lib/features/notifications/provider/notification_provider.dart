import 'package:charity_management_app/features/notifications/data/notification_service.dart';
import 'package:charity_management_app/features/notifications/domain/notification_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final notificationStreamProvider =
    StreamProvider<List<NotificationModel>>((ref) {
  return ref.watch(notificationServiceProvider).getNotification();
});
