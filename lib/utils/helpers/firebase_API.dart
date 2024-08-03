import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? fcmToken;

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    '0', // id
    'High Importance Notifications', // title
    importance: Importance.max,
  );

  Future init() async {
    _firebaseMessaging.requestPermission();
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      print('Message received: ${message.notification?.title}');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher'); // Your app icon

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
      );

      flutterLocalNotificationsPlugin.initialize(initializationSettings);

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android?.smallIcon,
                // other properties...
              ),
            ));
      }
    });
    await updateDeviceToken();
  }

  Future<void> updateDeviceToken() async {
    if (fcmToken == null) {
      fcmToken = await _firebaseMessaging.getToken();
    }
    DioHelper dio = DioHelper();
    Map<String, dynamic> postBody = {"device_token": "$fcmToken"};
    final response = dio.postData(URL: URL.updateDeviceToken, body: postBody);
    print(response);
    print(response);
    print(response);
    print(response);
    print(response);
    print(response);
    print(response);
  }
}
