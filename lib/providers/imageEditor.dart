import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as imgLib;
import 'package:path/path.dart';

class ImageEditor with ChangeNotifier {
  imgLib.Image _loadedImage;
  imgLib.Image _previewImage;
  String _fileName;
  int _brightness = 0;
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

  int get brightness {
    return _brightness;
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
    _brightness = brightness;
    _previewImage = imgLib.Image.from(_loadedImage);
    _previewImage = imgLib.brightness(previewImage, brightness);
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }

  void restoreDefaults() {
    _brightness = 0;
    _previewImage = imgLib.Image.from(_loadedImage);
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }

  Future<List<int>> compressFile(File file) async {
    var result =
        await FlutterImageCompress.compressWithFile(file.absolute.path);
    return result;
  }
}
