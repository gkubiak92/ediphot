import 'package:flutter/material.dart';

class EditOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const EditOption({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icon),
            iconSize: 36,
            onPressed: () => onTap(),
          ),
          Text(title),
        ],
      ),
    );
  }
}
