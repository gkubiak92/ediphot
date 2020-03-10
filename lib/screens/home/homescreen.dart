import 'package:ediphot/screens/home/widgets/homeheader.dart';
import 'package:ediphot/screens/home/widgets/homemenu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeHeader(),
          HomeMenu(),
        ],
      ),
    );
  }
}
