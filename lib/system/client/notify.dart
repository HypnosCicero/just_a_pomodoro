import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showNotification() {
  Fluttertoast.showToast(
    msg: 'This is a notification message',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}