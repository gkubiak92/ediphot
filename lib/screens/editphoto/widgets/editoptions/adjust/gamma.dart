import 'package:ediphot/providers/imageEditor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gamma extends StatefulWidget {
  @override
  _GammaState createState() => _GammaState();
}

class _GammaState extends State<Gamma> {
  ImageEditor imageEditor;
  double _gamma = 1.0;
  @override
  void initState() {
    imageEditor = Provider.of<ImageEditor>(context, listen: false);
    _gamma = imageEditor.adjustValues['gamma'];
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
        label: 'Gamma',
        min: 0.0,
        value: _gamma,
        max: 2.0,
        onChanged: (double newValue) {
          setState(() {
            _gamma = newValue;
          });
        },
        onChangeEnd: (double newValue) {
          imageEditor.adjustImage(
            gamma: newValue,
          );
        },
      ),
    );
  }
}
