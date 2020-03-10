import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/photofilters.dart';

class EditImage with ChangeNotifier {
  imageLib.Image _image;

  imageLib.Image get image {
    return _image;
  }

  void setEditImage(imageLib.Image img) {
    _image = img;
    notifyListeners();
  }

  void setFilter(String filterName, imageLib.Image img, String filename) {
    Filter filter =
        presetFiltersList.firstWhere((element) => element.name == filterName);
    List<int> bytes = applyFilter(
      {"filter": filter, "image": img, "filename": filename},
    );

    notifyListeners();
  }

  Widget buildImageWidget(
      Filter filter, imageLib.Image image, String filename) {
    return FutureBuilder<List<int>>(
      future: compute(applyFilter, <String, dynamic>{
        "filter": filter,
        "image": image,
        "filename": filename,
      }),
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            return Image.memory(
              snapshot.data,
              fit: BoxFit.contain,
            );
        }
        return null; // unreachable
      },
    );
  }
}
