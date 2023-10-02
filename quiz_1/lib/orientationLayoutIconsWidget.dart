import 'package:flutter/material.dart';

class OrientationLayoutIconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    
    if (orientation == Orientation.portrait) {
      return Row(
        children: <Widget>[
          Icon(Icons.star),
          Icon(Icons.star),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
        ],
      );
    }
  }
}
