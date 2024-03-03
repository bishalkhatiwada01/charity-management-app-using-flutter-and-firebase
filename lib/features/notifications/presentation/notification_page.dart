import 'package:charity_management_app/common/widgets/custom_app_bar.dart';
import 'package:charity_management_app/features/notifications/provider/notification_provider.dart';
import 'package:charity_management_app/features/notifications/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final asyncValue = ref.watch(notificationStreamProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
      ),
    );
  }
}
