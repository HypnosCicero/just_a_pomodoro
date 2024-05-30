import 'package:flutter/material.dart';

ColorScheme tomatoColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 187, 15, 2) , primary: Colors.red);
ColorScheme leavesColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 157, 5) , primary: Colors.green);
Color backgroundColor = Colors.white;

class Checkout {
  void printColor() {

    Color tomatoPrimaryColor = tomatoColorScheme.primary;
    Color tomatoOnPrimaryColor = tomatoColorScheme.onPrimary;
    Color tomatoInversePrimary = tomatoColorScheme.inversePrimary;
    print("tomatoColorScheme.primary = $tomatoPrimaryColor");
    print("tomatoColorScheme.onPrimary = $tomatoOnPrimaryColor");
    print("tomatoColorScheme.inversePrimary = $tomatoInversePrimary");

    Color leavesPrimaryColor = leavesColorScheme.primary;
    Color leavesOnPrimaryColor = leavesColorScheme.onPrimary;
    print("leavesColorScheme.primary = $leavesPrimaryColor");
    print("leavesColorScheme.onPrimary = $leavesOnPrimaryColor");
  }
}