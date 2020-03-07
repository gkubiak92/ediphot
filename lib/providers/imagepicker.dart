import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier {
  File _image;

  File get image {
    return _image;
  }

  void setImage(File img) {
    _image = img;
    notifyListeners();
  }

  Future<void> getImageAndEdit(context, ImageSource imageSource) async {
    var file = await ImagePicker.pickImage(source: imageSource);
    setImage(file);
    Navigator.of(context).pushNamed('/editphoto', arguments: file);
  }
}
