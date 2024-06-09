import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Notify {

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {


    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    
    final LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(
        defaultActionName: 'Open notification');

    final InitializationSettings initializationSettings = InitializationSettings(
      linux: initializationSettingsLinux);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  static Future<void> onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    NotificationResponseType notificationType =  notificationResponse.notificationResponseType;
    if(notificationType == NotificationResponseType.selectedNotification) {
      print("user clicks on it.");
    }
  }

 // const LinuxNotificationDetails linuxNotificationDetails = LinuxNotificationDetails(
    // );

  static Future<void> showNotification() async {
    const LinuxNotificationDetails linuxPlatformChannelSpecifics = LinuxNotificationDetails();

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(linux: linuxPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Hello',
      'This is a test notification',
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }
  
}