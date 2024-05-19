import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/clock_widget.dart';

class TimeBlock extends StatelessWidget {
  final int minutes;
  final int seconds;
  const TimeBlock({Key? key,required this.minutes,required this.seconds});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClockWidget(value: minutes),
        SizedBox(width: 15),
        //The area in the middle of the Clock widget 
        //the size can control by code
        ClockWidget(value: seconds),
      ],
    );
  }
}