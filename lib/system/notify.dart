import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:just_a_pomodoro/system/notify/notify_data.dart';
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

  static Future<void> showNotification(int time) async {
    const LinuxNotificationDetails linuxPlatformChannelSpecifics = LinuxNotificationDetails();

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(linux: linuxPlatformChannelSpecifics);

    List<NotifyData> _notify_data_list = NotifyDataFactory.createNotifyData();
    print("time = $time");
    NotifyData _notify_data = _notify_data_list[time % 3 - 1];
    await flutterLocalNotificationsPlugin.show(
      _notify_data.id,
      _notify_data.title,
      _notify_data.body,
      platformChannelSpecifics,
      payload: _notify_data.payload,
    );
  }
  
}