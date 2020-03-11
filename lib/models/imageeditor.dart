import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';

class ImageEditor {
  imageLib.Image _image;
  String _fileName;

  imageLib.Image get image {
    return _image;
  }

  String get fileName {
    return _fileName;
  }

  void setEditImageFromFile(File imageFile) {
    String fileName = basename(imageFile.path);
    _fileName = fileName;

    List<int> decodedImage = imageFile.readAsBytesSync();
    imageLib.Image img;
    img = imageLib.decodeImage(decodedImage);
    _image = img;
  }

  Widget getImageWidget() {
    List<int> imgBytes = imageLib.encodeNamedImage(image, fileName);
    return Image.memory(imgBytes);
  }

  void adjustImage({int brightness, int contrast}) {
    _image = imageLib.brightness(image, brightness);
    _image = imageLib.contrast(image, contrast);
  }
}
