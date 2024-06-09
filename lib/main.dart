import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/view/pomodoro_app.dart';
import 'package:just_a_pomodoro/system/notify.dart';

void main() {
  Notify.initNotification();
  runApp(const PomodoroApp());
}
