import 'package:ediphot/providers/imagepicker.dart';
import 'package:ediphot/screens/collage/editphotoscreen.dart';
import 'package:ediphot/screens/editphoto/editphotoscreen.dart';
import 'package:ediphot/screens/magicretouch/editphotoscreen.dart';
import 'package:ediphot/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagePickerProvider>(
            create: (_) => ImagePickerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(),
        home: HomeScreen(),
        routes: {
          EditPhotoScreen.routeName: (context) => EditPhotoScreen(),
          CollageScreen.routeName: (context) => CollageScreen(),
          MagicRetouchScreen.routeName: (context) => MagicRetouchScreen(),
        },
      ),
    );
  }
}
