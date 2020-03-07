import 'dart:io';

import 'package:flutter/material.dart';

class EditPhotoScreen extends StatefulWidget {
  static const routeName = '/editphoto';

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    File image = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: image == null
            ? Text('Choose photo from gallery')
            : Image.file(image),
      ),
    );
  }
}
