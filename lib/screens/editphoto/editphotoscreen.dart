import 'dart:io';

import 'package:ediphot/models/editoptionlist.dart';
import 'package:ediphot/screens/editphoto/widgets/editoption.dart';
import 'package:flutter/material.dart';

class EditPhotoScreen extends StatefulWidget {
  static const routeName = '/editphoto';

  @override
  _EditPhotoScreenState createState() => _EditPhotoScreenState();
}

class _EditPhotoScreenState extends State<EditPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    File image = ModalRoute.of(context).settings.arguments;
    List<Widget> options = EditOptionList.options
        .map((option) => EditOption(
              icon: option.icon,
              title: option.title,
            ))
        .toList();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: image == null
                  ? Text('Choose photo from gallery')
                  : Image.file(image)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[...options],
            ),
          )
        ],
      ),
    );
  }
}
