import 'package:flutter/material.dart';

class MagicRetouchScreen extends StatelessWidget {
  static const routeName = '/magicretouch';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('here will be magic retouch screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        onPressed: () {},
      ),
    );
  }
}
