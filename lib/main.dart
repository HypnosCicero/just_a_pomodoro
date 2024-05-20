import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/home.dart';

ColorScheme tomatoColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);

void main() {
  runApp(const PomodoroApp());
}

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
