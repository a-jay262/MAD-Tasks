import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final columnCount = (orientation == Orientation.portrait) ? 2 : 4;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
