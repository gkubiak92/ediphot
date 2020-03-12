import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imgLib;
import 'package:path/path.dart';

class ImageEditor with ChangeNotifier {
  imgLib.Image _editedImage;
  String _fileName;
  int _actualBrightness = 0;

  imgLib.Image get editedImage {
    return _editedImage;
  }

  String get fileName {
    return _fileName;
  }

  int get actualBrightness {
    return _actualBrightness;
  }

  void setEditImageFromFile(File imageFile) {
    String fileName = basename(imageFile.path);
    _fileName = fileName;

    List<int> decodedImage = imageFile.readAsBytesSync();
    imgLib.Image img;
    img = imgLib.decodeImage(decodedImage);
    _editedImage = img;
    notifyListeners();
  }

  Widget getImageWidget() {
    List<int> imgBytes = imgLib.encodeNamedImage(editedImage, fileName);
    return Image.memory(imgBytes);
  }

  void adjustImage({int brightness = 0}) {
    int brightnessToAdjust;
    if (brightness > actualBrightness) {
      brightnessToAdjust = brightness - actualBrightness;
      _actualBrightness += brightnessToAdjust;
    } else if (brightness < actualBrightness) {
      brightnessToAdjust = -(actualBrightness - brightness);
      _actualBrightness += brightnessToAdjust;
    } else {
      brightnessToAdjust = 0;
      _actualBrightness += brightnessToAdjust;
    }
    _editedImage = imgLib.brightness(editedImage, brightnessToAdjust);
    print(
        'adjusted Image to brightness: $brightness, actual: $actualBrightness');
    notifyListeners();
  }
}
