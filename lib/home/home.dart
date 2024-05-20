import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/clock_block.dart';

ColorScheme tomatoColorScheme = ColorScheme.fromSeed(seedColor: Colors.red);
ColorScheme backgroundColorScheme = ColorScheme.fromSeed(seedColor: Colors.white);
ColorScheme leavesColorScheme = ColorScheme.fromSeed(seedColor: Colors.green);
// 'HomePage' is not a key words
class HomePage extends StatelessWidget { 
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( // define main architecture
      appBar: AppBar(
        backgroundColor: tomatoColorScheme.primaryContainer,
        title: Center(
          child: Text("just a pomodoro")
          ),
      ),
      body:  ClockBlock(), 
      backgroundColor: backgroundColorScheme.primaryContainer,
    );
  }
}