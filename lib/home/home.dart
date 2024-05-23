import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/clock_block.dart';
import 'package:just_a_pomodoro/res/color_scheme.dart';

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
      backgroundColor: backgroundColor,
    );
  }
}