import 'package:ediphot/models/imageeditor.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/editoptionwidget.dart';
import 'package:flutter/material.dart';

class AdjustWidget extends EditOptionWidget {
  final imageEditor = ImageEditor();
  final String name;

  AdjustWidget(this.name) : super(name: name);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Slider(
          label: 'Brightness',
          min: -100,
          value: 0,
          max: 100,
          onChanged: (double newValue) {},
          onChangeEnd: (double newValue) => imageEditor.adjustImage(
            brightness: newValue.toInt(),
          ),
        )
      ],
    );
  }
}
