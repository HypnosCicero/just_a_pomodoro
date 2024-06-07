import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/view/components/clock_block.dart';
import 'package:just_a_pomodoro/res/color_scheme.dart';


class DistributionPage extends StatelessWidget { 
  const DistributionPage({super.key});
  
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
      backgroundColor: backgroundColorScheme.primary,
    );
  }
}