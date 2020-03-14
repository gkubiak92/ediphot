import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contrast extends StatefulWidget {
  @override
  _ContrastState createState() => _ContrastState();
}

class _ContrastState extends State<Contrast> {
  ImageEditor imageEditor;
  double _contrast = 1.0;
  @override
  void initState() {
    imageEditor = Provider.of<ImageEditor>(context, listen: false);
    _contrast = imageEditor.adjustValues['contrast'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      child: Slider(
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.black12,
        label: 'Contrast',
        min: 0.0,
        value: _contrast,
        max: 2.0,
        onChanged: (double newValue) {
          setState(() {
            _contrast = newValue;
          });
        },
        onChangeEnd: (double newValue) {
          imageEditor.adjustImage(
            contrast: newValue,
          );
        },
      ),
    );
  }
}
