import 'package:flutter/material.dart';

class OrientationBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
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
      },
    );
  }
}
