import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  Gratitude({Key? key, required this.radioGroupValue}) : super(key: key);
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
 late List<String> _gratitudeList=[];
  late String _selectedGratitude;
  late int _radioGroupValue;
  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();

    _gratitudeList
      ..add('Family')
      ..add('Friends')
      ..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gratitude'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () => Navigator.pop(context, _selectedGratitude),
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Radio(
                value: 0,
                groupValue: _radioGroupValue,
                 onChanged: (index) => _radioOnChanged(index!),
              ),
            Text('Family'),
            Radio(
                value: 1,
                groupValue: _radioGroupValue,
                 onChanged: (index) => _radioOnChanged(index!),),
            Text('Friends'),
            Radio(
                value: 2,
                groupValue: _radioGroupValue,
                 onChanged: (index) => _radioOnChanged(index!),
                 ),        
            Text('Coffee'),
          ]
          ),
        )));
  }
}
