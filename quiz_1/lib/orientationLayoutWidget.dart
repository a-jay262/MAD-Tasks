import 'package:flutter/material.dart';

class OrientationLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    
    if (orientation == Orientation.portrait) {
      return Container(
        color: Colors.yellow,
        height: 200,
        width: 200,
      );
    } else {
      return Container(
        color: Colors.green,
        height: 200,
        width: 200,
      );
    }
  }
}
