import 'package:ediphot/theme/style.dart';
import 'package:flutter/material.dart';

import 'screens/home/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
