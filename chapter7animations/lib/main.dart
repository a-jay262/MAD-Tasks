import 'package:flutter/material.dart';
import 'package:chapter7animations/home.dart';
import 'package:flutter/src/material/colors.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter Template',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:Home(),
    );
  }
}