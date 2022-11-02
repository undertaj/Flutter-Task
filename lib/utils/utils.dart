
import 'package:flutter/material.dart';

class Utils {
  static final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if(text == null) return;

    final snackBar = SnackBar(content: Text(text),backgroundColor: Colors.deepPurple, duration: const Duration(seconds: 3),);

    messengerKey.currentState!
      ..removeCurrentSnackBar
      ..showSnackBar(snackBar);
  }
}