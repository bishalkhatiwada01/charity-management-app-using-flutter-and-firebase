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
      title: Text(notification.postHeadline),
      subtitle: Text(
          'Time: ${timeAgo(DateTime.parse(notification.time))}\nAddress: ${notification.address}'),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PostDetailsPage(
        //       postModel: notification.postModel,
        //     ),
        //   ),
        // );
      },
    );
  }

  String timeAgo(DateTime date) {
    Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 0) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} minute(s) ago';
    } else {
      return 'Just now';
    }
  }
}
