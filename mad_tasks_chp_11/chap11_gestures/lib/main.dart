import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ch11_gestures_drag_drop',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomeScreen(),
    );
  }
}
