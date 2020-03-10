import 'dart:io';

import 'package:ediphot/models/editoptionlist.dart';
import 'package:ediphot/providers/editimage.dart';
import 'package:ediphot/screens/editphoto/widgets/editoption.dart';
import 'package:ediphot/screens/editphoto/widgets/filters/filter_tile_list.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:provider/provider.dart';

class EditPhotoScreen extends StatefulWidget {
  static const routeName = '/editphoto';

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  bool _showFilters = false;
  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    File image = ModalRoute.of(context).settings.arguments;
    var fileName = basename(image.path);
    var img = imageLib.decodeImage(image.readAsBytesSync());
    //editedImg = imageLib.brightness(img, 100);

    List<Widget> options = EditOptionList.options
        .map(
          (option) => EditOption(
            icon: option.icon,
            title: option.title,
            onTap: _toggleFilters,
          ),
        )
        .toList();

    var editPhotoProvider = Provider.of<EditImage>(context);
    editPhotoProvider.setEditImage(img);
    img = editPhotoProvider.image;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: image == null
                ? Text('Choose photo from gallery')
                : editPhotoProvider.buildImageWidget(
                    WillowFilter(), img, fileName),
          ),
          _showFilters
              ? FilterTileList()
              : Container(
                  width: 0,
                ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[...options],
            ),
          ),
        ],
      ),
    );
  }

  final loader = Center(child: CircularProgressIndicator());
  imageLib.Image editedImg;
  List<Filter> filters = presetFiltersList;

  // Widget _buildFilteredImage(
  //   Filter filter,
  //   imageLib.Image image,
  //   String filename,
  // ) {
  //   return FutureBuilder<List<int>>(
  //     future: compute(applyFilter, <String, dynamic>{
  //       "filter": filter,
  //       "image": image,
  //       "filename": filename,
  //     }),
  //     builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //           return loader;
  //         case ConnectionState.active:
  //         case ConnectionState.waiting:
  //           return loader;
  //         case ConnectionState.done:
  //           if (snapshot.hasError)
  //             return Center(child: Text('Error: ${snapshot.error}'));
  //           return Image.memory(
  //             snapshot.data,
  //             fit: BoxFit.contain,
  //           );
  //       }
  //       return null; // unreachable
  //     },
  //   );
  // }
}
