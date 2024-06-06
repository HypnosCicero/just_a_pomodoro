import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/home.dart';
import 'package:just_a_pomodoro/res/color_scheme.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //the code which is define the application
      title: 'Pomodoro App',
      theme: ThemeData(
        colorScheme: tomatoColorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}