import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editoptionwidget.dart';

class RestoreDefaults extends StatelessWidget with EditOptionWidget {
  final String name;

  RestoreDefaults({this.name});

  @override
  Widget build(BuildContext context) {
    final imageEditor = Provider.of<ImageEditor>(context);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Do you really want to restore defaults?')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                imageEditor.restoreDefaults();
              },
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        )
      ],
    );
  }
}
