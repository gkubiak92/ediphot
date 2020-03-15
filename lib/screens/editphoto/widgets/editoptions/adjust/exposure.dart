import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Exposure extends StatefulWidget {
  @override
  _ExposureState createState() => _ExposureState();
}

class _ExposureState extends State<Exposure> {
  ImageEditor imageEditor;
  double _exposure = 0.0;
  @override
  void initState() {
    imageEditor = Provider.of<ImageEditor>(context, listen: false);
    _exposure = imageEditor.adjustValues['exposure'];
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
        min: -2.0,
        value: _exposure,
        max: 2.0,
        onChanged: (double newValue) {
          setState(() {
            _exposure = newValue;
          });
        },
        onChangeEnd: (double newValue) {
          imageEditor.adjustImage(
            exposure: newValue,
          );
        },
      ),
    );
  }
}
