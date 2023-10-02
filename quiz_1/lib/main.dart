import 'package:flutter/material.dart';
import 'myContentWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Orientation Handling App'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: MyContentWidget(),
          ),
        ),
      ),
    );
  }
}
