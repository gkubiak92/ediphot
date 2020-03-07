import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPhotoScreen extends StatefulWidget {
  static const routeName = '/editphoto';

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? Text('Choose photo from gallery')
            : Image.file(_image),
      ),
    );
  }
}
