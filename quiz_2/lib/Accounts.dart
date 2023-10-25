import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  @override
  _Accounts createState() => _Accounts();
}

class _Accounts extends State<Accounts> {
  int _currentAccount = 0;

  List<String> accountNames = ['Account 1', 'Account 2', 'Account 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Switcher'),
      ),
      body: ListView.builder(
        itemCount: accountNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(accountNames[index]),
            leading: Radio(
              value: index,
              groupValue: _currentAccount,
              onChanged: (int? value) {
                setState(() {
                  _currentAccount = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
