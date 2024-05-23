import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_a_pomodoro/home/time_block.dart';
import 'package:just_a_pomodoro/res/color_scheme.dart';

class ClockBlock extends StatefulWidget {
  const ClockBlock({super.key});

  @override
  _ClockBlockState createState() => _ClockBlockState();
}

class _ClockBlockState extends State<ClockBlock> {
  // late Timer _timer;
  Timer? _timer; // There is a hidden danger of null point anomaly
  List<int> _minutesArray = [25, 5];
  late int _minutes;
  late int _arrayIndex;
  int _seconds = 0;
  bool _isSelected = false;
  
  @override
  void initState() {
    super.initState();
    _minutes = _minutesArray[0];
    _arrayIndex = 0;
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_seconds > 0) {
          _seconds--;
        } else {
          if(_minutes > 0) {
            _minutes--;
            _seconds =59;
          } else {
            _arrayIndex++;
            _minutes = _minutesArray[_arrayIndex %= 2];
            if(_minutes == 5) {
              backgroundColor = leavesColorScheme.primaryContainer;
            } else {
              backgroundColor = tomatoColorScheme.primaryContainer;
            }
          }
        }
      });
     });
  }
  void _togglePlayPause() {
    setState(() {
      if(_isSelected) {
        _timer?.cancel();
        backgroundColor = backgroundColor;
      } else {
        _startTimer();
        backgroundColor = tomatoColorScheme.primaryContainer;
      }
      _isSelected = !_isSelected;
    });
  }
  void _initTimes() {
    setState(() {
      _timer?.cancel();
      _minutes = 25;
      _seconds = 0;
      _arrayIndex = 0;
      _isSelected = false;
      backgroundColor = backgroundColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _initTimes();
                }, 
                child: Icon(
                  size: 36,
                  Icons.replay_rounded
                  ),
                ),
            ],
          ),
          SizedBox(height: 40),
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeBlock(minutes: _minutes ,seconds: _seconds),
            ]
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _togglePlayPause,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: _isSelected? Icon(color: Colors.green, size:36, Icons.pause) : Icon(color: tomatoColorScheme.primary, size:36, Icons.play_arrow),
                ),
              ),
              
            ],
          ),
            
        ],
      )
    );
  }
}