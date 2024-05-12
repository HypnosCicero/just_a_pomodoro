import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';

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

// 'HomePage' is not a key words
class HomePage extends StatelessWidget { 
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( // define main architecture
      appBar: AppBar(
        backgroundColor: backgroundColorScheme.background,
        title: Center(
          child: Text("just a pomodoro")
          ),
      ),
      body:  ClockBlock(), 
      backgroundColor: backgroundColorScheme.background,
    );
  }
}
class ClockBlock extends StatefulWidget {
  const ClockBlock({super.key});

  @override
  _ClockBlockState createState() => _ClockBlockState();
}

class _ClockBlockState extends State<ClockBlock> {
  late Timer _timer;
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
    _timer.cancel();
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
          }
        }
      });
     });
  }
  void _togglePlayPause() {
    setState(() {
      if(_isSelected) {
        _timer.cancel();
      } else {
        _startTimer();
      }
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClockWidget(value: _minutes),
            SizedBox(width: 15),
            //The area in the middle of the Clock widget 
            //the size can control by code
            ClockWidget(value: _seconds)
          ]
        ),
          GestureDetector(
            onTap: _togglePlayPause,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _isSelected? Icon(size:36, Icons.pause) : Icon(size:36, Icons.play_arrow),
            ),
          )
      ],
    );
  }
}

/**
 * Class for build the singol clock block struct
 */
class ClockWidget extends StatelessWidget {
  final int value;
  const ClockWidget({Key? key,required this.value});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8)
      ), 
      child: Text(
        value.toString().padLeft(2, '0'),
        style: TextStyle(fontSize:36),
      )
    );
  }
}

