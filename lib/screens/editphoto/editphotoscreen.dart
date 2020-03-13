import 'dart:io';
import 'package:ediphot/models/editoptionlist.dart';
import 'package:ediphot/providers/imageEditor.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/adjustwidget.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/editoptionbutton.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/filterslist.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/photofilters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:provider/provider.dart';

class EditPhotoScreen extends StatefulWidget {
  static const routeName = '/editphoto';
  final List<dynamic> editWidgetlist = [
    FiltersList(name: 'Filters'),
    AdjustWidget(name: 'Adjust'),
  ];

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  File imageFile;
  bool _isInit = false;
  bool _showEditOption = false;
  Widget _selectedEditOption;

  void _toggleEditOption(String option) {
    Widget widgetToShow =
        widget.editWidgetlist.firstWhere((element) => element.name == option);
    setState(() {
      if (!_showEditOption) {
        _showEditOption = true;
        _selectedEditOption = widgetToShow;
      } else if (_showEditOption && _selectedEditOption != widgetToShow) {
        _selectedEditOption = widgetToShow;
      } else {
        _showEditOption = !_showEditOption;
        _selectedEditOption = widgetToShow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> options = EditOptionList.options
        .map(
          (option) => EditOptionButton(
            icon: option.icon,
            title: option.title,
            onTap: () {
              _toggleEditOption(option.title);
            },
          ),
        )
        .toList();

    if (!_isInit) {
      final imageEditor = Provider.of<ImageEditor>(context, listen: false);
      imageFile = ModalRoute.of(context).settings.arguments;
      imageEditor.setEditImageFromFile(imageFile);
      setState(() {
        _isInit = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<ImageEditor>(
              builder: (_, imageEditor, child) {
                return imageEditor.getImageWidget();
              },
            ),
          ),
          _showEditOption
              ? _selectedEditOption
              : Container(
                  width: 0,
                ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                ...options,
                EditOptionButton(
                  icon: Icons.settings_backup_restore,
                  title: 'Restore',
                  onTap: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Restore defaults'),
                        content: Text('Are you sure?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Provider.of<ImageEditor>(context, listen: false)
                                  .restoreDefaults();
                              Navigator.of(context).pop();
                              setState(() {
                                _showEditOption = false;
                              });
                            },
                            child: Text('Yes'),
                          ),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('No'),
                          ),
                        ],
                        elevation: 24.0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final loader = Center(child: CircularProgressIndicator());
  imageLib.Image editedImg;
  List<Filter> filters = presetFiltersList;
}

List<int> buildImage(Map<String, dynamic> params) {
  imageLib.Image img = params["img"];
  String filename = params["filename"];
  List<int> _bytes = img.getBytes();
  imageLib.Image _image =
      imageLib.Image.fromBytes(img.width, img.height, _bytes);
  _bytes = imageLib.encodeNamedImage(_image, filename);

  return _bytes;
}
