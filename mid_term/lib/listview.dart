import 'package:flutter/material.dart';

class ProfileListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileListPage(),
    );
  }
}

class ProfileListPage extends StatelessWidget {
  final List<String> profileNames = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Wilson',
    'Ella Davis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile List'),
      ),
      body: ListView.builder(
        itemCount: profileNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // You can replace the image with your own profile pictures.
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
            title: Text(profileNames[index]),
          );
        },
      ),
    );
  }
}
