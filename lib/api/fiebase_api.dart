import 'dart:convert';

import 'package:charity_management_app/features/dashboard/home_page.dart';
import 'package:charity_management_app/features/posts/pages/post_page.dart';
import 'package:charity_management_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  await Firebase.initializeApp();
  final authData = await FirebaseAuth.instance.authStateChanges().last;
  if (authData == null) {
    if (message == null) return;
    final String route = message.data['route'];
    if (route == "post") {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      navigatorKey.currentState?.pushNamed('/notification');
    }
  }
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> createTopic() async {
    final response =
        await _firebaseMessaging.subscribeToTopic('posts').then((value) {
      return 'Subscribed to posts topic';
    });
    return response;
  }

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notification',
    importance: Importance.max,
  );

  final _localNotification = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    if (kDebugMode) {
      print(message.notification?.title);
    }
    if (kDebugMode) {
      print(message.notification?.body);
    }
    final String route = message.data['route'];
    if (route == "post") {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const PostPage(),
        ),
      );
    }
  }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
            importance: _androidChannel.importance,
            priority: Priority.high,
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotifications() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(iOS: ios, android: android);
    await _localNotification.initialize(settings,
        onDidReceiveNotificationResponse: (detail) {
      if (detail.payload == null) return;
      final message = RemoteMessage.fromMap(jsonDecode(detail.payload ?? ""));
      handleMessage(message);
    });
    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (platform != null) {
      await platform.createNotificationChannel(_androidChannel);
    }
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final token = await _firebaseMessaging.getToken();
    if (token == null) return;
    if (kDebugMode) {
      print('Token: $token');
    }
    _firebaseMessaging.subscribeToTopic('posts');
    initPushNotification();
    initLocalNotifications();
  }
}
