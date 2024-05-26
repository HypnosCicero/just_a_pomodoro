import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notify {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  
  Notify() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializeNotifications();
  }
  Future<void> initializeNotifications() async {
    var initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: IOSInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification selection here
  }

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
}
