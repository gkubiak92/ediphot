import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  final String name;
  final String imageUrl;

  const FilterTile({Key key, this.name, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 1,
      )),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
