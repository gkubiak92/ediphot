import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Saturation extends StatefulWidget {
  @override
  _SaturationState createState() => _SaturationState();
}

class _SaturationState extends State<Saturation> {
  ImageEditor imageEditor;
  double _saturation = 1.0;
  @override
  void initState() {
    imageEditor = Provider.of<ImageEditor>(context, listen: false);
    _saturation = imageEditor.adjustValues['saturation'];
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
        label: 'Saturation',
        min: 0.0,
        value: _saturation,
        max: 2.0,
        onChanged: (double newValue) {
          setState(() {
            _saturation = newValue;
          });
        },
        onChangeEnd: (double newValue) {
          imageEditor.adjustImage(
            saturation: newValue,
          );
        },
      ),
    );
  }
}
