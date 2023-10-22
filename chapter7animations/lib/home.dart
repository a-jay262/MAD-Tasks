import 'package:flutter/material.dart';
import 'package:chapter7animations/widgets/animatedContainer.dart';
import 'package:chapter7animations/widgets/animatedCrossFade.dart';
import 'package:chapter7animations/widgets/animatedOpacity.dart';
import 'package:chapter7animations/widgets/animatedOpacity.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get flexibleSpace => null;


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
              children: <Widget>[
                AnimatedContainerWidget(),
                Divider(),
                AnimatedCrossFadeWidget(),
                Divider(),
                AnimatedOpacityWidget(),
              ],
            ),
        ),
        );
    }
}