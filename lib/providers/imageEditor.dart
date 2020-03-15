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
    'saturation': 1.0,
    'gamma': 1.0,
    'exposure': 0.0,
    'hue': 0.0,
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
    double saturation,
    double gamma,
    double exposure,
    double hue,
  }) {
    _adjustValues['brightness'] = brightness ?? _adjustValues['brightness'];
    _adjustValues['contrast'] = contrast ?? _adjustValues['contrast'];
    _adjustValues['saturation'] = saturation ?? _adjustValues['saturation'];
    _adjustValues['gamma'] = gamma ?? _adjustValues['gamma'];
    _adjustValues['exposure'] = exposure ?? _adjustValues['exposure'];
    _adjustValues['hue'] = hue ?? _adjustValues['hue'];
    _previewImage = imgLib.Image.from(_loadedImage);
    //_previewImage = imgLib.brightness(previewImage, brightness);
    _previewImage = imgLib.adjustColor(
      previewImage,
      brightness: brightness,
      contrast: contrast,
      saturation: saturation,
      gamma: gamma,
      exposure: exposure,
      hue: hue,
    );
    _previewImgBytes = imgLib.encodeNamedImage(previewImage, fileName);
    notifyListeners();
  }

  void restoreDefaults() {
    _adjustValues['brightness'] = 1.0;
    _adjustValues['contrast'] = 1.0;
    _adjustValues['saturation'] = 1.0;
    _adjustValues['gamma'] = 1.0;
    _adjustValues['exposure'] = 1.0;
    _adjustValues['hue'] = 1.0;
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
