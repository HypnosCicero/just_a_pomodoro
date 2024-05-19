import 'dart:async';
//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/home.dart';

ColorScheme tomatoColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);
ColorScheme backgroundColorScheme = ColorScheme.fromSeed(seedColor: Colors.white);

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //the code which is define the application
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: tomatoColorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
