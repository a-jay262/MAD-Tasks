import 'package:flutter/material.dart';
class About extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: Text('About'),
 ),
 body: SafeArea(
 child: Padding(
 padding: const EdgeInsets.all(16.0),
 child: Center(
        child: Icon(
          Icons.house,
          size: 120.0,
          color: Colors.red,
        ),
      ),
 ),
 ),
 );
 }
}