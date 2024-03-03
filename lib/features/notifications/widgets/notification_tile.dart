import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/features/notifications/domain/notification_model.dart';
import 'package:charity_management_app/features/posts/pages/post_detail_page.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  NotificationTile({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(notification.title),
      subtitle:
          Text('Time: ${timeAgo(DateTime.parse(notification.createdAt))}'),
      onTap: () {},
    );
  }
}
