import 'package:flutter/material.dart';

class CollageScreen extends StatelessWidget {
  static const routeName = '/collage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('here will be collage creator'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        onPressed: () {},
      ),
    );
  }
}
