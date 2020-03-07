import 'package:ediphot/providers/imagepicker.dart';
import 'package:ediphot/screens/collage/editphotoscreen.dart';
import 'package:ediphot/screens/editphoto/editphotoscreen.dart';
import 'package:ediphot/screens/home/widgets/homecard.dart';
import 'package:ediphot/screens/home/widgets/homeheader.dart';
import 'package:ediphot/screens/home/widgets/homemenu.dart';
import 'package:ediphot/screens/magicretouch/editphotoscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
