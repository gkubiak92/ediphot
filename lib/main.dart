import 'package:ediphot/screens/collage/editphotoscreen.dart';
import 'package:ediphot/screens/editphoto/editphotoscreen.dart';
import 'package:ediphot/screens/magicretouch/editphotoscreen.dart';
import 'package:ediphot/screens/takephoto/takephotoscreen.dart';
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
      routes: {
        TakePhotoScreen.routeName: (context) => TakePhotoScreen(),
        EditPhotoScreen.routeName: (context) => EditPhotoScreen(),
        CollageScreen.routeName: (context) => CollageScreen(),
        MagicRetouchScreen.routeName: (context) => MagicRetouchScreen(),
      },
    );
  }
}
