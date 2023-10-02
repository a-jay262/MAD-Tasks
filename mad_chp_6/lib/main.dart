import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(42, 228, 5, 1),
          title: Text('My Flutter App'),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          flexibleSpace: SafeArea(
            child: Icon(
              Icons.photo_camera,
              size: 75.0,
              color: Colors.white70,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              color: Colors.lightGreen.shade100,
              height: 75.0,
              width: double.infinity,
              child: Center(
                child: Text('Bottom'),
              ),
            ),
            preferredSize: Size.fromHeight(75.0),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.play_arrow),
          backgroundColor: Colors.lightGreen.shade100,
        ),
// or
// This creates a Stadium Shape FloatingActionButton
// floatingActionButton: FloatingActionButton.extended(
// onPressed: () {},
// icon: Icon(Icons.play_arrow),
// label: Text('Play'),
// ),
        bottomNavigationBar: BottomAppBar(
          //hasNotch: true,
          color: Colors.lightGreen.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.pause),
              Icon(Icons.stop),
              Icon(Icons.access_time),
              Padding(
                padding: EdgeInsets.all(32.0),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Columns and Row Nesting 1',
              ),
              Text(
                'Columns and Row Nesting 2',
              ),
              Text(
                'Columns and Row Nesting 3',
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Row Nesting 1'),
                  Text('Row Nesting 2'),
                  Text('Row Nesting 3'),
                ],
              ),
            ],
          ),
          
        ),
        
      ),
    );
  }
}
