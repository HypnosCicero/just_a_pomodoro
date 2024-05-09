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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClockWidget(value: _minutes),
                SizedBox(width: 10),
                ClockWidget(value: _seconds)
              ]
            ),
          ),
        ),
        Center(
          child: ElevatedButton (
            onPressed: () {
              _startTimer();
              }, 
            child: Text("开始")
          ),
        ), 
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
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8)
      ), 
      child: Text(
        value.toString().padLeft(2, '0'),
        style: TextStyle(fontSize: 24),
      )
    );
  }
}

