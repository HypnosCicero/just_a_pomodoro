import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void showNotification() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    'channel_description',
    importance: Importance.max,
    priority: Priority.high,
    sound: RawResourceAndroidNotificationSound('your_custom_sound'),
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails();

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'Notification Title',
    'Notification Body',
    platformChannelSpecifics,
    payload: 'notification_payload',
  );
}