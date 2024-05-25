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
    //sound: RawResourceAndroidNotificationSound('your_custom_sound'),
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails();

  var macOSPlatformChannelSpecifics = MacOSNotificationDetails();
  
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
    macOS: macOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'Is Time to Rest',
    'You are hard work by 25 minutes',
    platformChannelSpecifics,
    payload: 'notification_payload',
  );
}