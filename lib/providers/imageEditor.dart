import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imgLib;
import 'package:path/path.dart';

class ImageEditor with ChangeNotifier {
  imgLib.Image _loadedImage;
  imgLib.Image _previewImage;
  String _fileName;
  int defaultBrightness = 0;
  int previewBrightness = 0;
  List<int> _loadedImgBytes;
  List<int> _previewImgBytes;

  imgLib.Image get loadedImage {
    return _loadedImage;
  }

  imgLib.Image get previewImage {
    return _previewImage;
  }

  String get fileName {
    return _fileName;
  }

  List<int> get loadedImgBytes {
    return _loadedImgBytes;
  }

  List<int> get previewImgBytes {
    return _previewImgBytes;
  }

  void setEditImageFromFile(File imageFile) {
    String fileName = basename(imageFile.path);
    _fileName = fileName;

    List<int> decodedImage = imageFile.readAsBytesSync();
    _loadedImage = imgLib.decodeImage(decodedImage);
    _previewImgBytes = imgLib.encodeNamedImage(loadedImage, fileName);
    notifyListeners();
  }

  Widget getImageWidget() {
    return Image.memory(previewImgBytes);
  }

  void adjustImage({int brightness = 0}) {
    _previewImage = imgLib.Image.from(_loadedImage);
    _previewImage = imgLib.brightness(previewImage, brightness);
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }

  void restoreDefaults() {
    _previewImage = imgLib.Image.from(_loadedImage);
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }
}
