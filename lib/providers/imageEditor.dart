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
  List<int> _loadedImgBytes;
  List<int> _previewImgBytes;

  Map<String, dynamic> _adjustValues = {
    'brightness': 1.0,
    'contrast': 1.0,
  };

  Map<String, dynamic> get adjustValues {
    return _adjustValues;
  }

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

  Future<void> setEditImageFromFile(File imageFile) async {
    _fileName = basename(imageFile.path);
    List<int> decodedImage = await compressFile(imageFile);
    _loadedImage = imgLib.decodeImage(decodedImage);
    _previewImgBytes = imgLib.encodeNamedImage(loadedImage, fileName);
    notifyListeners();
  }

  //old sync method
  // void setEditImageFromFile(File imageFile) {
  //   String fileName = basename(imageFile.path);
  //   _fileName = fileName;
  //   List<int> decodedImage = imageFile.readAsBytesSync();
  //   _loadedImage = imgLib.decodeImage(decodedImage);
  //   _previewImgBytes = imgLib.encodeNamedImage(loadedImage, fileName);
  //   notifyListeners();
  // }

  Widget getImageWidget() {
    return Image.memory(previewImgBytes);
  }

  void adjustImage({
    double brightness,
    double contrast,
  }) {
    _adjustValues['brightness'] = brightness ?? _adjustValues['brightness'];
    _adjustValues['contrast'] = contrast ?? _adjustValues['contrast'];
    _previewImage = imgLib.Image.from(_loadedImage);
    //_previewImage = imgLib.brightness(previewImage, brightness);
    _previewImage = imgLib.adjustColor(
      previewImage,
      brightness: brightness,
      contrast: contrast,
    );
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }

  void restoreDefaults() {
    _adjustValues['brightness'] = 1;
    _adjustValues['contrast'] = 1;
    _previewImage = imgLib.Image.from(_loadedImage);
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }

  Future<List<int>> compressFile(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
    );
    return result;
  }
}
