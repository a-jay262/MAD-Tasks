import 'package:flutter/material.dart';
import 'About.dart';
import 'gratitude.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()), // use MaterialApp
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  void _onBottomNavigationBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Demo'),
      ),
      drawer: Drawer(backgroundColor: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: Icon(
                Icons.face,
                size: 48.0,
                color: Colors.white,
              ),
              // ignore: prefer_const_constructors
              accountName: Text('Sandy Smith'),
              accountEmail: Text('sandy.smith@domainname.com'),
              otherAccountsPictures: <Widget>[
                Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                )
              ],
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/download.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             ListTile(
              leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
               ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
               ListTile(
               leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
               ListTile(
               leading: Icon(Icons.home),
                title: Text('Home'),

              ),
               ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),

                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomNavigationBarTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_satisfied),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Profile',
            ),
          ],
          selectedIconTheme: IconThemeData(color: Colors.blue),
          unselectedIconTheme: IconThemeData(color: Colors.black)),
      body: pages[_currentIndex],
    );
  }

  final List<Widget> pages = [
    HomePage(),
    BirthdayPage(),
    Gratitude(
      radioGroupValue: 1,
    ),
    About(),
  ];
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.house,
          size: 120.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class BirthdayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.cake,
          size: 120.0,
          color: Colors.purple,
        ),
      ),
    );
  }
}


/*
NAVIGATION
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _howAreYou = "...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullscreenDialog: true,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ),
    );
  }

  _openPageAbout(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      ),
    );
  }
  
  _openPageGratitude({required BuildContext context,bool fullscreenDialog = false})async {
     final String _gratitudeResponse = await Navigator.push( 
         context,    MaterialPageRoute(fullscreenDialog: fullscreenDialog,      builder: (context) => Gratitude(radioGroupValue: 1,),
      ),  );  _howAreYou = _gratitudeResponse ?? ''; 
  }
}*/


