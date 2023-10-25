import 'package:flutter/material.dart';
import 'Accounts.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendLinkScreen(),
    );
  }
}

class SendLinkScreen extends StatefulWidget {
  @override
  _SendLinkScreenState createState() => _SendLinkScreenState();
}

class _SendLinkScreenState extends State<SendLinkScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Enter an email that you need us to register to your account...'),
            SizedBox(height: 16),
            Text('Email:'),
            TextField(
              controller: linkController,
              keyboardType: TextInputType.url,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Accounts(),
                ));
              },
              child: Text('Send Link'),
            ),
            Text("Forgot Password"),
          ],
        ),
      ),
    );
  }
}
