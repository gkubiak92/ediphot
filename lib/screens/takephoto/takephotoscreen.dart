import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoScreen extends StatefulWidget {
  static const routeName = '/takephoto';

  @override
  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

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
        child: _image == null ? Text('No image selected') : Image.file(_image),
      ),
    );
  }
}
