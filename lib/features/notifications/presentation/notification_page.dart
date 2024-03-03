import 'package:charity_management_app/common/widgets/custom_app_bar.dart';
import 'package:charity_management_app/features/notifications/provider/notification_provider.dart';
import 'package:charity_management_app/features/notifications/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final notificationData = ref.watch(notificationProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
      ),
      body: notificationData.when(
        data: (data) {
          return data.isEmpty
              ? const Center(
                  child: Text('No notifications'),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(notificationProvider);
                  },
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final notification = data[index];
                      return NotificationTile(
                        notification: notification,
                      );
                    },
                  ),
                );
        },
        error: (e, s) => Center(
          child: Text(e.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
