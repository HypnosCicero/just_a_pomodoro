import 'package:flutter/material.dart';
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