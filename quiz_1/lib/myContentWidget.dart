import 'orientationLayoutIconsWidget.dart';
import 'package:flutter/material.dart';
import 'orientationLayoutWidget.dart';
import 'gridViewWidget.dart';
import 'orientationBuilderWidget.dart';

class MyContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        OrientationLayoutIconsWidget(),
        SizedBox(height: 20),
        OrientationLayoutWidget(),
        SizedBox(height: 20),
        GridViewWidget(),
        SizedBox(height: 20),
        OrientationBuilderWidget(),
      ],
    );
  }
}
