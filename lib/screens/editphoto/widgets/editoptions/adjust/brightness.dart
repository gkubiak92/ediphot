import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Brightness extends StatefulWidget {
  @override
  _BrightnessState createState() => _BrightnessState();
}

class _BrightnessState extends State<Brightness> {
  ImageEditor imageEditor;
  double _brightness = 1.0;
  @override
  void initState() {
    imageEditor = Provider.of<ImageEditor>(context, listen: false);
    _brightness = imageEditor.adjustValues['brightness'];
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
        label: 'Brightness',
        min: 0.0,
        value: _brightness,
        max: 2.0,
        onChanged: (double newValue) {
          setState(() {
            _brightness = newValue;
          });
        },
        onChangeEnd: (double newValue) {
          imageEditor.adjustImage(
            brightness: newValue,
          );
        },
      ),
    );
  }
}
