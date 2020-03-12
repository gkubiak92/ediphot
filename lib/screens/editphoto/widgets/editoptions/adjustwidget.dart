import 'package:ediphot/providers/imageEditor.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/editoptionwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdjustWidget extends StatefulWidget with EditOptionWidget {
  final String name;

  AdjustWidget({this.name});

  @override
  _AdjustWidgetState createState() => _AdjustWidgetState();
}

class _AdjustWidgetState extends State<AdjustWidget> {
  double _brightness = 0;
  double contrast = 0;

  @override
  Widget build(BuildContext context) {
    final imageEditor = Provider.of<ImageEditor>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 400,
          child: Slider(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.black12,
            label: 'Brightness',
            min: -100,
            value: _brightness,
            max: 100,
            onChanged: (double newValue) {
              setState(() {
                _brightness = newValue;
              });
            },
            onChangeEnd: (double newValue) {
              imageEditor.adjustImage(
                brightness: newValue.toInt(),
              );
              print('changed brighntess to $newValue');
              imageEditor.adjustImage(brightness: newValue.toInt());
            },
          ),
        )
      ],
    );
  }
}
