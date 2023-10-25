import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: FirstScreen(),
    ));
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ));
        },
        child: Hero(
          tag: 'colorBox', // Unique hero tag
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Drawer Item 1'),
              onTap:() {
                // Handle the action when Drawer Item 1 is tapped.
              },
            ),
            ListTile(
              title: Text('Drawer Item 2'),
              onTap: () {
                // Handle the action when Drawer Item 2 is tapped.
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: 'colorBox', // Same hero tag as in the FirstScreen
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle the action when the home button is pressed.
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Handle the action when the favorites button is pressed.
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle the action when the settings button is pressed.
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
