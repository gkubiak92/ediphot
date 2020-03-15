import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hue extends StatefulWidget {
  @override
  _HueState createState() => _HueState();
}

class _HueState extends State<Hue> {
  ImageEditor imageEditor;
  double _hue = 0.0;
  @override
  void initState() {
    imageEditor = Provider.of<ImageEditor>(context, listen: false);
    _hue = imageEditor.adjustValues['hue'];
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
        label: 'Exposure',
        min: -45.0,
        value: _hue,
        max: 45.0,
        onChanged: (double newValue) {
          setState(() {
            _hue = newValue;
          });
        },
        onChangeEnd: (double newValue) {
          imageEditor.adjustImage(
            hue: newValue,
          );
        },
      ),
    );
  }
}
